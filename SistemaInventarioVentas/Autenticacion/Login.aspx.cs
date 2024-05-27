using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Autenticacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAcceder_Click(object sender, EventArgs e)
        {

            // Metodo para crear la conexión a la base de datos
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();

                    // Query para la consulta SQL para buscar el producto
                    string queryBuscar = "SELECT IdUsuario, NombreUsuario, NombreRol FROM Usuarios INNER JOIN Roles ON Usuarios.IdRol = Roles.IdRol WHERE NombreUsuario = @NombreUsuario and Clave = @Clave";

                    // Crea el comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);
                    cmdBuscar.CommandType = CommandType.Text;
                    cmdBuscar.Parameters.AddWithValue("@NombreUsuario", txtUsuario.Text);
                    cmdBuscar.Parameters.AddWithValue("@Clave", txtPassword.Text);
                    // Ejecuta la consulta con el dataReader y lee la informacion
                    SqlDataReader reader = cmdBuscar.ExecuteReader();
                    if (reader.Read())
                    {

                        Session["NombreUsuario"] = reader["NombreUsuario"].ToString();
                        Session["NombreRol"] = reader["NombreRol"].ToString();
                        Response.Redirect("../AboutUs.aspx");
                    }
                    else
                    {
                        lblError.Text = "CREDENCIALES INCORRECTAS INTENTEN DE NUEVO";
                    }
                    reader.Close();
                }
                catch (Exception)
                {
                    // Labe de mensaje de error, si se produce un error en la consulta
                    lblError.Text = "Algo salio mal, intente mas tarde";
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