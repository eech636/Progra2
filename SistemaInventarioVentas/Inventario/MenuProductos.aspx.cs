using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Inventario
{
        public partial class MenuProductos : System.Web.UI.Page
        {
            public List<Dictionary<String, String>> listaProductos = new List<Dictionary<String, String>>();
            public double totalPaginas = 0;
            public double tPages = 10;

            protected void Page_Load(object sender, EventArgs e)
            {
                AutenticacionValidador.ValidacionSesion(this);
                AutenticacionValidador.ValidacionPermisos(this, "SUPERVISOR");

                if (!IsPostBack)
                {
                    SqlProductos();
                    TotalRegistrosProductos();
                }
            }

            protected void BtnBuscar_Click(object sender, EventArgs e)
            {
                string searchTerm = TxtBuscar.Text.Trim();
                SqlProductos(searchTerm);
                TotalRegistrosProductos(searchTerm);
            }

            private void SqlProductos(string searchTerm = "")
            {
                listaProductos.Clear();
                using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
                {
                    try
                    {
                        conexionBuscar.Open();
                        double offSet = (string.IsNullOrEmpty(Request.QueryString["page"]) ? 0 : int.Parse(Request.QueryString["page"]) - 1) * tPages;

                        string queryBuscar = "SELECT * FROM Productos";
                        if (!string.IsNullOrEmpty(searchTerm))
                        {
                            queryBuscar += " WHERE NombreProducto LIKE '%' + @SearchTerm + '%' OR Descripcion LIKE '%' + @SearchTerm + '%'";
                        }
                        queryBuscar += " ORDER BY IdProducto OFFSET " + offSet + " ROWS FETCH NEXT " + tPages + " ROWS ONLY";

                        SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);
                        if (!string.IsNullOrEmpty(searchTerm))
                        {
                            cmdBuscar.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");
                        }

                        SqlDataReader reader = cmdBuscar.ExecuteReader();
                        while (reader.Read())
                        {
                            listaProductos.Add(new Dictionary<String, String>(){
                            {"IdProducto", reader["IdProducto"].ToString()},
                            {"NombreProducto", reader["NombreProducto"].ToString()},
                            {"CantidadDisponible", reader["CantidadDisponible"].ToString()},
                            {"Precio", reader["Precio"].ToString()},
                            {"PrecioCosto", reader["PrecioCosto"].ToString()},
                            {"Descripcion", reader["Descripcion"].ToString() }
                        });
                        }
                        reader.Close();

                    if (listaProductos.Count == 0)
                    {
                        LblMensaje.Text = "No se encontraron productos que coincidan con la de búsqueda.";
                        LblMensaje.Visible = true;
                    }
                    else
                    {
                        LblMensaje.Visible = false;
                    }


                }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                    }
                    finally
                    {
                        conexionBuscar.Close();
                    }
                }
            }

            private void TotalRegistrosProductos(string searchTerm = "")
            {
                using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
                {
                    try
                    {
                        conexionBuscar.Open();
                        string queryBuscar = "SELECT COUNT(*) FROM Productos";
                        if (!string.IsNullOrEmpty(searchTerm))
                        {
                            queryBuscar += " WHERE NombreProducto LIKE '%' + @SearchTerm + '%' OR Descripcion LIKE '%' + @SearchTerm + '%'";
                        }

                        SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);
                        if (!string.IsNullOrEmpty(searchTerm))
                        {
                            cmdBuscar.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");
                        }

                        int totalProductos = (int)cmdBuscar.ExecuteScalar();
                        double tP = totalProductos / tPages;
                        totalPaginas = Math.Ceiling(tP);
                    }
                    catch (Exception ex)
                    {
                       
                    }
                    finally
                    {
                        conexionBuscar.Close();
                    }
                }
            }
        }
    
        
}
