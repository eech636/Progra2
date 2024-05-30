using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Usuario
{
    public partial class AgregarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            AutenticacionValidador.ValidacionSesion(this);
            AutenticacionValidador.ValidacionPermisos(this, "ADMIN");

        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                string NombreUsuario = TxtBoxNombreUsuario.Text.ToString();
                string clave = TxtBoxClave.Text.ToString();
                string Email = TxtBoxEmail.Text.ToString();
                //string Rol = TxtBoxRol.Text.ToString();


                SqlConnection conexion = null;
                SqlCommand Comando = null;
                
                // Instanciamos el objeto "conexion"
                conexion = Conexion.getInstance().ConexionBDProyect();

                // Validacion de Usuario
                Comando = new SqlCommand("SELECT * FROM Usuarios WHERE NombreUsuario = @NombreUsuario", conexion);
                Comando.CommandType = CommandType.Text;
                Comando.Parameters.AddWithValue("@NombreUsuario", NombreUsuario);

                conexion.Open();

                SqlDataReader reader = Comando.ExecuteReader();

                if (reader.HasRows)
                {
                    LblError.CssClass = "alert alert-warning";
                    LblError.Text = "El nombre de usuario ya existe.";
                    reader.Close();
                    return;
                }
                reader.Close ();

                // Definimos un objeto para manejar la instrucción SQL
                Comando = new SqlCommand("INSERT INTO Usuarios (NombreUsuario, Clave, Email, IdRol) values (@NombreUsuario, @Clave, @Email, @IdRol)", conexion);
                Comando.CommandType = CommandType.Text;
                Comando.Parameters.AddWithValue("@NombreUsuario", NombreUsuario);
                Comando.Parameters.AddWithValue("@Clave", clave);
                Comando.Parameters.AddWithValue("@Email", Email);
                //Comando.Parameters.AddWithValue("@IdRol", Rol);

                // Almacenamos la cantidad de filas afectadas por la consulta SQL
                int filas = Comando.ExecuteNonQuery();
                if (filas > 0)
                {
                    LblError.CssClass = "alert alert-success";
                    LblError.Text = "Usuario Creado.";

                }
                else
                {
                    LblError.CssClass = "alert alert-warning";
                    LblError.Text = "Usuario no creado.";

                }
                conexion.Close();
            }
            catch (Exception x)
            {
                LblError.CssClass = "alert alert-danger";
                LblError.Text = x.Message;
            }
            

        }

    }
}