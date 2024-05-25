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
        //creacion del diccionario
        public List<Dictionary<String, String>> listaProductos = new List<Dictionary<String, String>>();
        public double totalPaginas = 0;
        public double tPages = 10;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar autenticación y permisos
            AutenticacionValidador.ValidacionSesion(this);
            AutenticacionValidador.ValidacionPermisos(this, "SUPERVISOR");
            SqlProductos();
            TotalRegistrosProductos();



        }

        private void SqlProductos ()
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();
                    double offSet = (string.IsNullOrEmpty(Request.QueryString["page"]) ? 0 : int.Parse(Request.QueryString["page"]) - 1) * tPages;

                    // Query para la consulta SQL para buscar el producto
                    string queryBuscar = "SELECT * FROM Productos order by IdProducto offset " + offSet + "rows fetch next " + tPages + " rows only";

                    // Crea el comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);

                    SqlDataReader reader = cmdBuscar.ExecuteReader();
                    while (reader.Read())
                    {
                        listaProductos.Add(new Dictionary<String, String>(){
                            {"IdProducto", reader["IdProducto"].ToString()},
                            {"NombreProducto", reader["NombreProducto"].ToString()},
                            {"CantidadDisponible", reader["CantidadDisponible"].ToString()},
                            {"Precio", reader["Precio"].ToString()},
                            {"PrecioCosto", reader["PrecioCosto"].ToString()},
                            {"Descripcion", reader ["Descripcion"].ToString() }
                        });
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                }
                finally
                {
                    // Cierra la conexión
                    conexionBuscar.Close();
                }
            }
        }


        private void TotalRegistrosProductos()
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la conexion buscar
                    conexionBuscar.Open();
                    // Query para la consulta SQL para buscar el producto
                    string queryBuscar = "SELECT COUNT(*) FROM Productos";

                    // Creacion del comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);

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
