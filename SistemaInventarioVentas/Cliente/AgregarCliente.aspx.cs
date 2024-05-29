using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Cliente
{
    public partial class AgregarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AutenticacionValidador.ValidacionSesion(this);
            AutenticacionValidador.ValidacionPermisos(this, "ADMIN");
        }

        protected void cvTelefono_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !Telefonoyaexistente(args.Value);
        }

        private bool Telefonoyaexistente(string value)
        {
            throw new NotImplementedException();
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                string NombreCliente = TxtNombreC.Text.ToString();
                string Telefono = TxtTelefono.Text.ToString();
                string Email = TxtEmail.Text.ToString();
                string Direccion = TxtDireccion.Text.ToString();

                SqlConnection conexion = null;
                SqlCommand Comando = null;

                // Instanciamos el objeto "conexion"
                conexion = Conexion.getInstance().ConexionBDProyect();

                // Validacion de Cliente
                Comando = new SqlCommand("SELECT * FROM Clientes WHERE NombreCliente = @NombreCliente", conexion);
                Comando.CommandType = CommandType.Text;
                Comando.Parameters.AddWithValue("@NombreCliente", NombreCliente);

                conexion.Open();

                SqlDataReader reader = Comando.ExecuteReader();

                if (reader.HasRows)
                {
                    LblError.CssClass = "alert alert-warning";
                    LblError.Text = "El nombre del Cliente ya existe.";
                    reader.Close();
                    return;
                }
                reader.Close();

                // Definimos un objeto para manejar la instrucción SQL
                Comando = new SqlCommand("INSERT INTO Clientes (NombreCliente, TelefonoCliente, CorreoCliente, Direccion) values (@NombreCliente, @TelefonoCliente, @CorreoCliente, @IDireccion)", conexion);
                Comando.CommandType = CommandType.Text;
                Comando.Parameters.AddWithValue("@NombreCliente", NombreCliente);
                Comando.Parameters.AddWithValue("@TelefonoCliente", Telefono);
                Comando.Parameters.AddWithValue("@CorreoCliente", Email);
                Comando.Parameters.AddWithValue("@Direccion", Direccion);

                // Almacenamos la cantidad de filas afectadas por la consulta SQL
                int filas = Comando.ExecuteNonQuery();
                if (filas > 0)
                {
                    LblError.CssClass = "alert alert-success";
                    LblError.Text = "Cliente Creado.";

                }
                else
                {
                    LblError.CssClass = "alert alert-warning";
                    LblError.Text = "Cliente no creado.";

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
