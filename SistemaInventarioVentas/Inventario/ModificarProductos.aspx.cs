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

        }

        protected void BtnModificarBuscar_Click(object sender, EventArgs e)
        {
            //este condicional verifica que la campo del id del producto no este vacio
            if (string.IsNullOrEmpty(TxtIdProducto.Text))
            {

                LabelMensajeBuscar.Text = "Por favor ingrese un Id de producto";
                return; 
            }

            int idProducto = Convert.ToInt32(TxtIdProducto.Text);

            // Metodo para crear la conexión a la base de datos
            using (SqlConnection conexionBuscar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abrir la coonexion creada
                    conexionBuscar.Open();

                    // Query para la consulta SQL para buscar el producto
                    string queryBuscar = "SELECT NombreProducto, Precio,PrecioCosto, CantidadDisponible, Descripcion FROM Productos WHERE IdProducto = " + idProducto;

                    // Crea el comando SQL
                    SqlCommand cmdBuscar = new SqlCommand(queryBuscar, conexionBuscar);

                    // Ejecuta la consulta con el dataReader y lee la informacion
                    SqlDataReader reader = cmdBuscar.ExecuteReader();
                    if (reader.Read())
                    {
                        // Muestra los datos del producto en los campos correspondientes
                        TxtModificarNombre.Text = reader["NombreProducto"].ToString();
                        TxtModificarPrecio.Text = reader["Precio"].ToString();
                        TxtPrecioCosto.Text = reader["PrecioCosto"].ToString();
                        TxtModificarCantidad.Text = reader["CantidadDisponible"].ToString();
                        TxtModificarDescripcion.Text = reader["Descripcion"].ToString();
                        LabelMensajeBuscar.Text = "";
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Labe de mensaje de error, si se produce un error en la consulta
                    LabelMensajeBuscar.Text = "Error al buscar el producto: " + ex.Message;
                }
                finally
                {
                    // Cierra la conexión
                    conexionBuscar.Close();
                }
            }
        }


        protected void BtnGuardarModificar_Click(object sender, EventArgs e)
        {
            // Obtiene los valores del producto a modificar
            int idProducto = Convert.ToInt32(TxtIdProducto.Text);
            string nuevoNombreProducto = TxtModificarNombre.Text;
            decimal nuevoPrecio = Convert.ToDecimal(TxtModificarPrecio.Text);
            decimal nuevoPrecioCosto = Convert.ToDecimal(TxtPrecioCosto.Text);
            int nuevaCantidad = Convert.ToInt32(TxtModificarCantidad.Text);
            string nuevaDescripcion = TxtModificarDescripcion.Text;

            // Crea la conexión a la base de datos
            using (SqlConnection conexionModificar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    // Abre la conexión
                    conexionModificar.Open();

                    // Crea la consulta SQL para modificar el producto
                    string queryConsulta = "UPDATE Productos SET NombreProducto = '" + nuevoNombreProducto + "', Precio = " + nuevoPrecio + ", PrecioCosto = " + nuevoPrecioCosto + ", CantidadDisponible = " + nuevaCantidad + ", Descripcion = '" + nuevaDescripcion + "' WHERE IdProducto = " + idProducto;

                    // Crea el comando SQL
                    SqlCommand cmd = new SqlCommand(queryConsulta, conexionModificar);

                    // Ejecutar la consulta SQL
                    int filasAfectadas = cmd.ExecuteNonQuery();

                    // Verificar si se modificó el producto correctamente
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
                    // Label de mensaje de error si se produce algun error en la modificacion del producto
                    LbMensajeProductoModificado.Text = "Error al modificar el producto: " + ex.Message;
                }
                finally
                {
                    // Cerrar la conexión
                    conexionModificar.Close();
                }
            }
        }
    }
}