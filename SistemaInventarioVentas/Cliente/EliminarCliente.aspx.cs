using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
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
            AutenticacionValidador.ValidacionPermisos(this, "ADMIN");

        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string NombreCliente = TxtNomCliente.Text.ToString();

                SqlConnection conexion = null;
                SqlCommand Comando = null;

                // Instanciamos el objeto "conexion"
                conexion = Conexion.getInstance().ConexionBDProyect();


                Comando = new SqlCommand($"DELETE FROM Clientes WHERE NombreCliente={NombreCliente}", conexion);
                conexion.Open();
                int filas = Comando.ExecuteNonQuery();
                if (filas > 0)
                {
                    LblError.Text = "Cliente Eliminado";
                    LblError.CssClass = "alert alert-danger";
                }
                else
                {
                    LblError.Text = "Cliente NO eliminado";
                    LblError.CssClass = "alert alert-Warning";
                }
                conexion.Close();
            }
            catch (Exception x)
            {
                LblError.CssClass = "alert alert-danger";
                LblError.Text = x.Message;
            }
        }
    }
}