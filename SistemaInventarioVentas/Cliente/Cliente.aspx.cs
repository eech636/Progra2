using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        public double totalPaginas = 0;
        public double tPages = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            AutenticacionValidador.ValidacionSesion(this);
            sqlClientes();
            totalRegistros();
        }
        private void sqlClientes()
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

                    // Crea el comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);

                    // Ejecuta la consulta con el dataReader y lee la informacion
                    SqlDataReader reader = cmdBuscar.ExecuteReader();
                    while (reader.Read())
                    {
                        listacliente.Add(new Dictionary<String, String>(){
                            {"DUI", reader["DUI"].ToString()},
                            {"NombreCliente", reader["NombreCliente"].ToString()},
                            {"TelefonoCliente", reader["TelefonoCliente"].ToString()},
                            {"CorreoCliente", reader["CorreoCliente"].ToString()},
                            {"Direccion", reader["Direccion"].ToString()},
                        }) ;
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
        private void totalRegistros()
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
    }
}