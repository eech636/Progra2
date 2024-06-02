using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Ventas
{
    public partial class HistoricoVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        protected void LoadData()
        {
            SqlConnection connection = Conexion.getInstance().ConexionBDProyect();
            string query = @"SELECT DISTINCT
	                                    Ventas.idVenta,
	                                    Usuarios.NombreUsuario AS CreadaPor,
	                                    Ventas.DUI,
	                                    Ventas.FechaVenta,
	                                    (SELECT SUM(Cantidad) FROM ProductosVentas WHERE idVenta = Ventas.idVenta) AS CantidadArticulos,
	                                    (SELECT SUM(Precio * Cantidad) FROM ProductosVentas INNER JOIN Productos ON Productos.idProducto = ProductosVentas.idProducto WHERE idVenta = Ventas.idVenta) AS Total
	                                FROM Ventas
	                                INNER JOIN Usuarios ON Ventas.idUsuario = Usuarios.idUsuario";
            try
            {
                connection.Open();
                DataSet data = new DataSet();
                SqlDataAdapter reader = new SqlDataAdapter(query, connection);
                reader.Fill(data);

                GVVentas.DataSource = data;
                GVVentas.DataBind();
            } catch
            {
            
            } finally
            {
                connection.Close();
            }
        }
    }
}