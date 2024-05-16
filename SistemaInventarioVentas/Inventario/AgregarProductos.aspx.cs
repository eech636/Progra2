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
        }

        protected void BtnGuardarArticulo_Click(object sender, EventArgs e)
        {
            //Obtiene los datos del producto a ingresar
            string nombre = TxtNombreArticulo.Text;
            decimal precio = Convert.ToDecimal(TxtPrecio.Text);
            int cantidadDisponible = Convert.ToInt32(TxtCantidadDisponible.Text);
            decimal precioCosto = Convert.ToDecimal(TxtPrecioCosto.Text);
            string descripcion = TxtDescricionArticulo.Text;

            //Estable la conexion a la BD creando la instancia
            using (SqlConnection conexionAgregar = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    //Abre la conexion
                    conexionAgregar.Open();

                   //Crea el query insert para registrar los datos del producto
                    string queryAgregar = "INSERT INTO Productos (NombreProducto, Precio, CantidadDisponible, PrecioCosto, Descripcion) " +
                                   "VALUES ('" + nombre + "', " + precio + ", " + cantidadDisponible + ", " + precioCosto + ", '" + descripcion + "')";

                   //Ejecuta el query con los datos
                    SqlCommand cmd = new SqlCommand(queryAgregar, conexionAgregar);
                    cmd.ExecuteNonQuery();

                    //label de mensaje de que se ha registrado el producto

                    LabelMensajeAgregar.Text = "El producto se agrego exitosamente";

                }
                //Arroja label de mensaje de error en caso de produczca un error en el registro del producto

                catch (Exception ex)
                {

                    LabelMensajeAgregar.Text = "Error al agregar el producto: " + ex.Message;
                }
                finally
                {
                   //Cierra la conexion con la BD
                    conexionAgregar.Close();
                }
            }
        }

        
    }
}