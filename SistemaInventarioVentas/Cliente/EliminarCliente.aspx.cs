using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Cliente
{
    public partial class EliminarCliente : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            AutenticacionValidador.ValidacionSesion(this);

            string duiClienteStr = Request.QueryString["dui"];
            if (!string.IsNullOrEmpty(duiClienteStr))
            {
                // Cargar detalles del cliente
                CargarDetallesCliente(duiClienteStr);
            }
        }

        private void CargarDetallesCliente(string duiCliente)
        {
            using (SqlConnection conexion = Conexion.getInstance().ConexionBDProyect())
            {
                try
                {
                    conexion.Open();
                    string query = "SELECT NombreCliente, TelefonoCliente, CorreoCliente, Direccion FROM Clientes WHERE DUI = @DUI";
                    SqlCommand cmd = new SqlCommand(query, conexion);
                    cmd.Parameters.AddWithValue("@DUI", duiCliente);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        GridViewCliente.DataSource = dt;
                        GridViewCliente.DataBind();
                    }
                    else
                    {
                        GridViewCliente.DataSource = null;
                        GridViewCliente.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error al cargar los detalles del cliente: " + ex.Message);
                    throw ex;
                }
            }
        }

        protected void BtnEliminarCliente_Click(object sender, EventArgs e)
        {
            string duiClienteStr = Request.QueryString["dui"];
            if (!string.IsNullOrEmpty(duiClienteStr))
            {
                using (SqlConnection conexionEliminar = Conexion.getInstance().ConexionBDProyect())
                {
                    try
                    {
                        conexionEliminar.Open();
                        string queryEliminar = "DELETE FROM Clientes WHERE DUI = @DUI";
                        SqlCommand cmd = new SqlCommand(queryEliminar, conexionEliminar);
                        cmd.Parameters.AddWithValue("@DUI", duiClienteStr);

                        cmd.ExecuteNonQuery();

                        // Clear the GridView after deletion
                        GridViewCliente.DataSource = null;
                        GridViewCliente.DataBind();

                        // Redirigir a la página de MenuClientes
                        Response.Redirect("Cliente.aspx");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error al eliminar el cliente: " + ex.Message);
                    }
                }
            }
        }

        
    }
}
