using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Cliente
{
    public partial class ModificarCliente : System.Web.UI.Page
    {
        public static string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //agregar las otras lineas
                AutenticacionValidador.ValidacionSesion(this);

                //condicion de que el id que hemos puesto en la url no este null
                if (Request.QueryString["id"] != null)
                {
                    //Se le asigna a nuestra variable id de tipo int
                    id = Request.QueryString["id"].ToString();
                    LlenarFormulario();
                }
                else
                {
                    //Si no se encuentra el id nos mostrara un mensaje de error
                    LblMensaje.Text = "El ID no fue identificado";
                    LblMensaje.CssClass = "alert alert-danger";
                }
            }
        }
        public void LlenarFormulario()
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();
                    // Query para la consulta SQL para buscar el producto
                    string queryBuscar = "SELECT * FROM Clientes WHERE DUI = '" + id + "'";

                    // reader
                    SqlCommand command = conexionBuscar.CreateCommand();
                    command.CommandText = queryBuscar;
                    SqlDataReader sqlDataReader = command.ExecuteReader();
                    if (sqlDataReader.Read())
                    {
                        TxtNomCliente.Text = sqlDataReader["NombreCliente"].ToString();
                        TxtEmail.Text = sqlDataReader["CorreoCliente"].ToString();
                        TxtDireccion.Text = sqlDataReader["Direccion"].ToString();
                        TxtTelefono.Text = sqlDataReader["TelefonoCliente"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
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