using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Usuario
{
    public partial class EliminarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string IdUsuario = TxtBoxIdUsuario.Text.ToString();

                SqlConnection conexion = null;
                SqlCommand Comando = null;

                // Instanciamos el objeto "conexion"
                conexion = Conexion.getInstance().ConexionBDProyect();


                Comando = new SqlCommand($"DELETE FROM Usuarios WHERE IdUsuario={IdUsuario}", conexion);
                conexion.Open();
                int filas = Comando.ExecuteNonQuery();
                if (filas > 0)
                {
                    LblError.Text = "Usuario Eliminado";
                    LblError.CssClass = "alert alert-danger";
                }
                else {
                    LblError.Text = "Usuario NO eliminado";
                    LblError.CssClass = "alert alert-Warning";
                }
                conexion.Close();
            }
            catch(Exception x) 
            {
                LblError.CssClass = "alert alert-danger";
                LblError.Text = x.Message;
            }
        }
    }
}