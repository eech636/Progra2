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

        }

        protected void BtnEliminarProducto_Click(object sender, EventArgs e)
        {
            // Obtiene el ID del producto a eliminar
            int idProducto = Convert.ToInt32(TxtIdProducto.Text);

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
                        LbMensajeEliminar.Text = "Producto eliminado correctamente.";
                    }
                    else
                    {
                        LbMensajeEliminar.Text = "No se encontró ningún producto con el ID especificado.";
                    }
                }
                catch (Exception ex)
                {
                    // Label de mensaje en caso se produzca un error al eliminar el producto
                    LbMensajeEliminar.Text = "Error al eliminar el producto: " + ex.Message;
                }
                finally
                {
                    // Cierra la conexión
                    conexionEliminar.Close();
                }
            }
        }

    }
}