using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Usuarios
{
    public partial class EliminarUsuario : System.Web.UI.Page
    {
        public static int id = 0;
        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //agregar las otras lineas
                AutenticacionValidador.ValidacionSesion(this);
                AutenticacionValidador.ValidacionPermisos(this, "ADMIN");

                //condicion de que el id que hemos puesto en la url no este null
                if (Request.QueryString["id"] != null)
                {
                    //Se le asigna a nuestra variable id de tipo int
                    id = int.Parse(Request.QueryString["id"].ToString());

                    //mostramos los datos en un gv
                    GvUsuario.DataSource = SqlUsuario(id);
                    GvUsuario.DataBind();
                }
                else
                {
                    //Si no se encuentra el id nos mostrara un mensaje de error
                    lblMensaje.Text = "El ID no fue identificado";
                    lblMensaje.CssClass = "alert alert-danger";
                }
            }
        }
        private DataSet SqlUsuario(int id)
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();

                    // Query para la consulta SQL para buscar 
                    string queryBuscar = "SELECT * FROM Usuarios WHERE IdUsuario = " + id;

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
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            SqlEliminarUsuario(id);
            lblMensaje.CssClass = "alert alert-success";
            lblMensaje.Text = "Usuario Eliminado";
        }
            private DataSet SqlEliminarUsuario(int id)
            {
                using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
                {
                    try
                    {
                        // Abrir la coonexion creada
                        conexionBuscar.Open();

                        // Query para la consulta SQL para buscar 
                        string queryBuscar = "DELETE FROM Usuarios WHERE IdUsuario = " + id;

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
            Response.Redirect("/Usuarios/Usuarios.aspx");
        }
    }
}