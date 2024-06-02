using System;
using System.Collections.Generic;
using System.Data;
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
            
                string idProductoStr = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(idProductoStr) && int.TryParse(idProductoStr, out int idProducto))
                {
                    // Cargar detalles del producto
                    CargarDetallesProducto(idProducto);
                }
            
        }
        //metodo del boton de Cargar detalles para las vista del gridview
        private void CargarDetallesProducto(int idProducto)
        {
            using (SqlConnection conexion = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    conexion.Open();
                    string query = "SELECT NombreProducto,CantidadDisponible,PrecioCosto, Descripcion, Precio FROM Productos WHERE IdProducto = @IdProducto";
                    SqlCommand cmd = new SqlCommand(query, conexion);
                    cmd.Parameters.AddWithValue("@IdProducto", idProducto);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        GridViewProducto.DataSource = dt;
                        GridViewProducto.DataBind();
                    }
                    else
                    {
                        GridViewProducto.DataSource = null;
                        GridViewProducto.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error al cargar los detalles del producto: " + ex.Message);
                    throw ex;
                }
            }
        }
        //Metodo del boton eliminar

        protected void BtnEliminarProducto_Click(object sender, EventArgs e)
        {
            string idProductoStr = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(idProductoStr) && int.TryParse(idProductoStr, out int idProducto))
            {
                using (SqlConnection conexionEliminar = Conexion.getInstance().ConexionBDProyect())
                {
                    try
                    {
                        conexionEliminar.Open();
                        string queryEliminar = "DELETE FROM Productos WHERE IdProducto = @IdProducto";
                        SqlCommand cmd = new SqlCommand(queryEliminar, conexionEliminar);
                        cmd.Parameters.AddWithValue("@IdProducto", idProducto);

                        cmd.ExecuteNonQuery();

                        // Clear the GridView after deletion
                        GridViewProducto.DataSource = null;
                        GridViewProducto.DataBind();

                        // Redirigir a la página de MenuProductos
                        Response.Redirect("MenuProductos.aspx");
                    }
                    catch (Exception ex)
                    {
                        
                        Console.WriteLine("Error al eliminar el producto: " + ex.Message);
                    }
                }
            }
        }


        //metodo boton de regresar al menu
        protected void BtnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Inventario/MenuProductos.aspx");
        }
    } 
}