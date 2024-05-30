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
    public partial class EliminarCliente : System.Web.UI.Page
    {
        public static string id = "";
        public DataSet ds = new DataSet();
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

                    //mostramos los datos en un gv
                    GdvClientes.DataSource = SqlClientes(id);
                    GdvClientes.DataBind();
                }
                else
                {
                    //Si no se encuentra el id nos mostrara un mensaje de error
                    lblMensaje.Text = "El ID no fue identificado";
                    lblMensaje.CssClass = "alert alert-danger";
                }
            }
        }
        private DataSet SqlClientes(string id)
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                //try
                //{
                    // Abrir la coonexion creada
                    conexionBuscar.Open();
                    // Query para la consulta SQL para buscar el producto
                    string queryBuscar = "SELECT * FROM Clientes WHERE DUI = '" + id + "'";

                    // reader
                    SqlDataAdapter reader = new SqlDataAdapter(queryBuscar, conexionBuscar);
                    reader.Fill(ds);
                    return ds;
                //}
                //catch (Exception ex)
                //{
                    //throw new Exception(ex.Message);
                //}
                /*finally
                {
                    // Cierra la conexión
                    //conexionBuscar.Close();
                }*/
            }
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            SqlEliminarCliente(id);
            lblMensaje.CssClass = "alert alert-success";
            lblMensaje.Text = "Usuario Eliminado";
        }
        private DataSet SqlEliminarCliente(string id)
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();

                    // Query para la consulta SQL para buscar 
                    string queryBuscar = "DELETE FROM Clientes WHERE DUI = '" + id + "'";

                    SqlDataAdapter reader = new SqlDataAdapter(queryBuscar, conexionBuscar);
                    reader.Fill(ds);
                    return ds;
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
        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Cliente/Cliente.aspx");
        }
    }
}