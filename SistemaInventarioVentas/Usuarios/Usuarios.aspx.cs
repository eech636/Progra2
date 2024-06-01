using System;
using System.Collections.Generic;
using System.Data;
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
        public DataSet ds = new DataSet();  
        public double totalPaginas = 0;
        public double tPages = 10;
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack )
            {
                //agregar las otras lineas
                AutenticacionValidador.ValidacionSesion(this);
                AutenticacionValidador.ValidacionPermisos(this, "ADMIN");
                GdvUsuarios.DataSource = SqlUsuarios();
                GdvUsuarios.DataBind();
                TotalRegistros();
            }
 
          
            
        }
        protected void EliminarUsuariodb(int Id)
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();
                   

                    // Query para la consulta SQL para buscar 
                    string queryEliminarUsuario = "DELETE * FROM Usuarios WHERE IdUsuario = @IdUsuario"; 

                    // Crea el comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryEliminarUsuario, conexionBuscar);
                    cmdBuscar.Parameters.AddWithValue("@IdUsuario", Id);
                    cmdBuscar.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string script = "alert('Se produjo un error: " + ex.Message + "');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                }
                finally
                {
                    // Cierra la conexión
                    conexionBuscar.Close();
                }
            }
        }
        private DataSet SqlUsuarios()
        {
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la conexion creada
                    conexionBuscar.Open();
                    double offSet = (string.IsNullOrEmpty(Request.QueryString["page"]) ? 0 : int.Parse(Request.QueryString["page"]) - 1) * tPages;

                    // Query para la consulta SQL para buscar 
                    string queryBuscar = "SELECT u.IdUsuario, u.NombreUsuario, u.Email, r.NombreRol " +
                                         "FROM Usuarios u " +
                                         "JOIN Roles r ON u.IdRol = r.IdRol " +
                                         "ORDER BY u.IdUsuario " +
                                         "OFFSET " + offSet + " ROWS FETCH NEXT " + tPages + " ROWS ONLY";

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
                    // Query para la consulta SQL para buscar
                    string queryBuscar = "SELECT COUNT(*) FROM Usuarios";

                    // Crea el comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);

                    int totalUsuarios = (int)cmdBuscar.ExecuteScalar();
                    double tP = totalUsuarios / tPages;
                    totalPaginas = Math.Ceiling(tP);
                }
                catch (Exception)
                {
                }
                finally
                {
                    // Cierra la conexión
                    conexionBuscar.Close();
                }
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btnEliminar = (Button)sender;
            GridViewRow fila = (GridViewRow)btnEliminar.NamingContainer;

            id = fila.Cells[0].Text;
            Response.Redirect("/Usuarios/EliminarUsuario.aspx?id=" + id);
        }
    }
}