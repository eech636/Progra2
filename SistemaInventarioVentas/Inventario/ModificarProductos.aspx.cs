using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Inventario
{
    public partial class ModificarProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string productId = Request.QueryString["id"];
                    CargarDatosProducto(productId);
                }
            }
        }

        private void CargarDatosProducto(string productId)
        {
            if (!int.TryParse(productId, out int idProducto))
            {
                // Manejo de error si el ID del producto no es un número válido
                return;
            }

            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    conexionBuscar.Open();

                    string queryBuscar = "SELECT NombreProducto, Precio, PrecioCosto, CantidadDisponible, Descripcion FROM Productos WHERE IdProducto = @IdProducto";

                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);
                    cmdBuscar.Parameters.AddWithValue("@IdProducto", idProducto);

                    SqlDataReader reader = cmdBuscar.ExecuteReader();
                    if (reader.Read())
                    {
                        TxtModificarNombre.Text = reader["NombreProducto"].ToString();
                        TxtModificarPrecio.Text = reader["Precio"].ToString();
                        TxtPrecioCosto.Text = reader["PrecioCosto"].ToString();
                        TxtModificarCantidad.Text = reader["CantidadDisponible"].ToString();
                        TxtModificarDescripcion.Text = reader["Descripcion"].ToString();
                        LbMensajeProductoModificado.Text = "";
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    LbMensajeProductoModificado.Text = "Error al cargar los datos del producto: " + ex.Message;
                }
                finally
                {
                    conexionBuscar.Close();
                }
            }
        }

        protected void BtnGuardarModificar_Click(object sender, EventArgs e)
        {
            // Implementa tu lógica para guardar los cambios del producto

            int idProducto = Convert.ToInt32(Request.QueryString["id"]);
            string nuevoNombreProducto = TxtModificarNombre.Text;
            decimal nuevoPrecio = Convert.ToDecimal(TxtModificarPrecio.Text);
            decimal nuevoPrecioCosto = Convert.ToDecimal(TxtPrecioCosto.Text);
            int nuevaCantidad = Convert.ToInt32(TxtModificarCantidad.Text);
            string nuevaDescripcion = TxtModificarDescripcion.Text;

            using (SqlConnection conexionModificar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    conexionModificar.Open();

                    string queryConsulta = "UPDATE Productos SET NombreProducto = @NombreProducto, Precio = @Precio, PrecioCosto = @PrecioCosto, CantidadDisponible = @CantidadDisponible, Descripcion = @Descripcion WHERE IdProducto = @IdProducto";

                    SqlCommand cmd = new SqlCommand(queryConsulta, conexionModificar);
                    cmd.Parameters.AddWithValue("@NombreProducto", nuevoNombreProducto);
                    cmd.Parameters.AddWithValue("@Precio", nuevoPrecio);
                    cmd.Parameters.AddWithValue("@PrecioCosto", nuevoPrecioCosto);
                    cmd.Parameters.AddWithValue("@CantidadDisponible", nuevaCantidad);
                    cmd.Parameters.AddWithValue("@Descripcion", nuevaDescripcion);
                    cmd.Parameters.AddWithValue("@IdProducto", idProducto);

                    int filasAfectadas = cmd.ExecuteNonQuery();

                    if (filasAfectadas > 0)
                    {
                        LbMensajeProductoModificado.Text = "El producto ha sido modificado correctamente.";
                    }
                    else
                    {
                        LbMensajeProductoModificado.Text = "No se encontró ningún producto con el ID especificado.";
                    }
                }
                catch (Exception ex)
                {
                    LbMensajeProductoModificado.Text = "Error al modificar el producto: " + ex.Message;
                }
                finally
                {
                    conexionModificar.Close();
                }
            }
        }
        protected void BtnRegresarProductos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Inventario/MenuProductos.aspx");
        }

    }
}