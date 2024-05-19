using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Usuario
{
    public partial class Usuarios : System.Web.UI.Page
    {
        public List<Dictionary<String, String>> listausuarios = new List<Dictionary<String, String>>();
        public double totalPaginas = 0;
        public double tPages = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            AutenticacionValidador.ValidacionSesion(this);
            AutenticacionValidador.ValidacionPermisos(this, "ADMIN");
            sqlUsuarios();
            totalRegistros();
        }
        private void sqlUsuarios()
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();
                    double offSet = (string.IsNullOrEmpty(Request.QueryString["page"]) ? 0 : int.Parse(Request.QueryString["page"]) - 1) * tPages;

                    // Query para la consulta SQL para buscar 
                    string queryBuscar = "SELECT * FROM Usuarios order by IdUsuario offset " + offSet + "rows fetch next " + tPages + " rows only";

                    // Crea el comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);

                    // Ejecuta la consulta con el dataReader y lee la informacion
                    SqlDataReader reader = cmdBuscar.ExecuteReader();
                    while (reader.Read())
                    {
                        listausuarios.Add(new Dictionary<String, String>(){
                            {"IdUsuario", reader["IdUsuario"].ToString()},
                            {"NombreUsuario", reader["NombreUsuario"].ToString()},
                            {"Clave", reader["Clave"].ToString()},
                            {"Email", reader["Email"].ToString()},
                            {"IdRol", reader["IdRol"].ToString()},
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
        private void totalRegistros()
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();
                    // Query para la consulta SQL para buscar
                    string queryBuscar = "SELECT COUNT(*) FROM Usuarios";

                    // Crea el comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);

                    int totalUsuarios = (int)cmdBuscar.ExecuteScalar();
                    double tP = totalUsuarios / tPages;
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