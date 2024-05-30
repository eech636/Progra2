using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Inventario
{
    public partial class EliminarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AutenticacionValidador.ValidacionSesion(this);

            // Obtiene el ID del producto a eliminar desde la URL
            int idProducto = Convert.ToInt32(Request.QueryString["id"]);

            // Llama al método para eliminar el producto
            BtnEliminarProducto_Click(idProducto);
        }

        protected void BtnEliminarProducto_Click(int idProducto)
        {
            // Crea la conexión a la base de datos
            using (SqlConnection conexionEliminar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abre la conexión
                    conexionEliminar.Open();

                    // Crea la consulta SQL para eliminar el producto
                    string queryEliminar = "DELETE FROM Productos WHERE IdProducto = " + idProducto;

                    // Crea el comando SQL
                    SqlCommand cmd = new SqlCommand(queryEliminar, conexionEliminar);

                    // Ejecuta la consulta SQL
                    int filasAfectadas = cmd.ExecuteNonQuery();

                    // Verifica si se eliminó el producto correctamente
                    if (filasAfectadas > 0)
                    {
                        // Redirige a la página de inventario
                        Response.Redirect("~SistemaInventarioVentas.Inventario.MenuProductos.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('No se encontró ningún producto con el ID especificado.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error al eliminar el producto: " + ex.Message + "');</script>");
                }
                finally
                {
                    conexionEliminar.Close();
                }
            }
        }
    }
}
