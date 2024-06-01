using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Schema;

namespace SistemaInventarioVentas.Cliente
{
    public partial class Cliente : System.Web.UI.Page
    {
        public List<Dictionary<String, String>> listacliente = new List<Dictionary<String, String>>();
        public DataSet ds = new DataSet();
        public double totalPaginas = 0;
        public double tPages = 10;
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AutenticacionValidador.ValidacionSesion(this);
                GdvClientes.DataSource = SqlClientes();
                GdvClientes.DataBind();
                TotalRegistros();
            }
        }
        private DataSet SqlClientes()
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();
                    double offSet = (string.IsNullOrEmpty(Request.QueryString["page"]) ? 0 : int.Parse(Request.QueryString["page"])-1) * tPages;

                    // Query para la consulta SQL para buscar el producto
                    string queryBuscar = "SELECT * FROM Clientes order by DUI offset " + offSet + "rows fetch next " + tPages + " rows only";

                    // reader
                    SqlDataAdapter reader = new SqlDataAdapter(queryBuscar, conexionBuscar);
                    reader.Fill(ds);
                    return ds;
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error: {ex.Message}");
                }
                finally
                {
                    // Cierra la conexión
                    conexionBuscar.Close();
                }
            }
        }
        private void TotalRegistros()
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();
                    // Query para la consulta SQL para buscar el producto
                    string queryBuscar = "SELECT COUNT(*) FROM Clientes";

                    // Crea el comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);

                    int totalClientes = (int)cmdBuscar.ExecuteScalar();
                    double tP = totalClientes / tPages;
                    totalPaginas = Math.Ceiling(tP);
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
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btnEliminar = (Button)sender;
            GridViewRow fila = (GridViewRow)btnEliminar.NamingContainer;

            id = fila.Cells[0].Text;
            Response.Redirect("/Cliente/EliminarCliente.aspx?id=" + id);
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Button btnActualizar = (Button)sender;
            GridViewRow fila = (GridViewRow)btnActualizar.NamingContainer;

            id = fila.Cells[0].Text;
            Response.Redirect("/Cliente/ModificarCliente.aspx?id=" + id);
        }
    }
}