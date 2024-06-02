using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Ventas
{
    public partial class GenerarVenta : System.Web.UI.Page
    {
        List<Dictionary<string, object>> products = new List<Dictionary<string, object>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            AutenticacionValidador.ValidacionSesion(this);

            if (Session["Cart"] == null)
            {
                Response.Redirect("~/Ventas/Ventas");
                return;
            }

            products = (List<Dictionary<string, object>>)Session["Cart"];

            if (!IsPostBack)
            {
                LoadItems();
            }
        }

        protected void LoadItems()
        {
            DataTable items = ConvertToDataTable(products);
            GVItems.DataSource = items;
            GVItems.DataBind();
            LblTotal.Text = GetTotal().ToString();
        }

        private static DataTable ConvertToDataTable(List<Dictionary<string, object>> arrayOfDictionaries)
        {
            var dataTable = new DataTable();

            if (arrayOfDictionaries.Count == 0)
                return dataTable;

            foreach (var key in arrayOfDictionaries[0].Keys)
            {
                dataTable.Columns.Add(key);
            }

            foreach (var dict in arrayOfDictionaries)
            {
                var row = dataTable.NewRow();
                foreach (var kvp in dict)
                {
                    row[kvp.Key] = kvp.Value;
                }
                dataTable.Rows.Add(row);
            }

            return dataTable;
        }

        protected decimal GetTotal()
        {
            if (products.Count == 0) return 0m;

            return products.Sum(dict => Convert.ToDecimal(dict["Total"]));
        }

        protected void BtnProcess_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            BtnProcess.Enabled = false;

            SqlConnection connection = Conexion.getInstance().ConexionBDProyect();
            SqlCommand command = connection.CreateCommand();
            SqlTransaction transaction = null;

            try
            {
                connection.Open();
                transaction = connection.BeginTransaction();

                command.Transaction = transaction;
                command.CommandText = $"INSERT INTO VENTAS (idUsuario, idEstadoVenta, DUI, FechaVenta) VALUES (@idUsuario, @idEstadoVenta, @DUI, '{DateTime.Now}'); SELECT SCOPE_IDENTITY();";
                command.Parameters.AddWithValue("@idUsuario", Session["idCurrentUser"]);
                command.Parameters.AddWithValue("@idEstadoVenta", 1);
                command.Parameters.AddWithValue("@DUI", TxtDUICliente.Text);

                int ventaID = int.Parse(command.ExecuteScalar().ToString());

                command.Parameters.Clear();
                foreach (Dictionary<string, object> product in products)
                {
                    command.CommandText = "INSERT INTO ProductosVentas (idVenta, idProducto, Cantidad) VALUES (@idVenta, @idProducto, @Cantidad); UPDATE Productos SET CantidadDisponible = (SELECT CantidadDisponible From Productos WHERE idProducto = @idProducto) - @Cantidad WHERE idProducto = @idProducto";
                    command.Parameters.AddWithValue("@idVenta", ventaID);
                    command.Parameters.AddWithValue("@idProducto", product["idProducto"]);
                    command.Parameters.AddWithValue("@Cantidad", product["Cantidad"]);

                    command.ExecuteNonQuery();
                    command.Parameters.Clear();
                }


                transaction.Commit();
            }
            catch (Exception ex)
            {
                Debug.Write("ERROR!!!: ");
                Debug.WriteLine(ex);
                transaction.Rollback();
            } finally
            {
                connection.Close();
            }

            Session["Cart"] = null;
            LblSuccessMessage.Visible = true;
        }

        protected void ValidateDUIExistence_ServerValidate(object source, ServerValidateEventArgs args)
        {
            SqlConnection connection = Conexion.getInstance().ConexionBDProyect();
            SqlCommand command = connection.CreateCommand();

            try
            {
                connection.Open();
                command.CommandText = $"SELECT COUNT(DUI) FROM Clientes WHERE DUI = @DUI";
                command.Parameters.AddWithValue("@DUI", TxtDUICliente.Text);

                int count = int.Parse(command.ExecuteScalar().ToString());

                args.IsValid = count > 0;
            }
            catch (Exception ex)
            {
                Debug.Write("ERROR!!!: ");
                Debug.WriteLine(ex);
                args.IsValid = false;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}