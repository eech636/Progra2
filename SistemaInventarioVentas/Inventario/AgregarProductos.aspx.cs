using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Inventario
{
    public partial class AgregarProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AutenticacionValidador.ValidacionSesion(this);
            AutenticacionValidador.ValidacionPermisos(this, "ADMIN");
        }

        protected void BtnGuardarArticulo_Click(object sender, EventArgs e)
        {
            // Verifica si la página es válida
            if (Page.IsValid)
            {
                // Obtiene los datos del producto a ingresar
                string nombre = TxtNombreArticulo.Text;
                decimal precio = Convert.ToDecimal(TxtPrecio.Text);
                int cantidadDisponible = Convert.ToInt32(TxtCantidadDisponible.Text);
                decimal precioCosto = Convert.ToDecimal(TxtPrecioCosto.Text);
                string descripcion = TxtDescricionArticulo.Text;

                // Establece la conexión a la BD creando la instancia
                using (SqlConnection conexionAgregar = Conexion.getInstance().ConexionBDProyect())
                {
                    try
                    {
                        // Abre la conexión
                        conexionAgregar.Open();

                        // Crea el query insert para registrar los datos del producto
                        string queryAgregar = "INSERT INTO Productos (NombreProducto, Precio, CantidadDisponible, PrecioCosto, Descripcion) " +
                                       "VALUES ('" + nombre + "', " + precio + ", " + cantidadDisponible + ", " + precioCosto + ", '" + descripcion + "')";

                        // Ejecuta el query con los datos
                        SqlCommand cmd = new SqlCommand(queryAgregar, conexionAgregar);
                        cmd.ExecuteNonQuery();

                        // Label de mensaje de que se ha registrado el producto
                        LabelMensajeAgregar.Text = "El producto se agregó exitosamente";
                    }
                    catch (Exception ex)
                    {
                        // Label de mensaje de error en caso de que se produzca un error en el registro del producto
                        LabelMensajeAgregar.Text = "Error al agregar el producto: " + ex.Message;
                    }
                    finally
                    {
                        // Cierra la conexión con la BD 
                        conexionAgregar.Close();
                    }
                }
            }
            else
            {
                // Muestra un mensaje de error si la página no es válida
                LabelMensajeAgregar.Text = "Por favor, corrija los errores en el formulario antes de continuar";
            }
        }
        protected void ValidadorPrecioCostoMayor_ServerValidate(object source, ServerValidateEventArgs args)
        {
            decimal precioCosto = Convert.ToDecimal(TxtPrecio.Text);
            decimal precioVenta = Convert.ToDecimal(TxtPrecio.Text); 

            if (precioCosto > precioVenta)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

    }
}