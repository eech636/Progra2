using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SistemaInventarioVentas.Ventas
{
    public partial class AgregarArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AutenticacionValidador.ValidacionSesion(this);
            LoadProductsFromDB();

            if (!IsPostBack)
            {
                if (!string.IsNullOrWhiteSpace(Request.QueryString["searchTerm"]))
                {
                    SearchTerm.Text = Request.QueryString["searchTerm"];
                    BtnClear.Visible = true;
                }
            }

            if (GVItems.Rows.Count == 0)
            {
                LblItemsEmpty.Visible = true;
            }
        }

        protected void LoadProductsFromDB()
        {
            if (IsPostBack) return;

            DataSet dataSet = new DataSet();
            SqlConnection connection = Conexion.getInstance().ConexionBDProyect();
            SqlCommand command = connection.CreateCommand();
            command.CommandText = "SELECT idProducto, NombreProducto, Precio, CantidadDisponible FROM Productos";

            if (!string.IsNullOrWhiteSpace(Request.QueryString["searchTerm"]))
            {
                command.CommandText = $"{command.CommandText} WHERE LOWER(NombreProducto) LIKE @searchTerm";
                command.Parameters.AddWithValue("@searchTerm", $"%{Request.QueryString["searchTerm"].ToLower()}%");
            }

            try
            {
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dataSet);

                GVItems.DataSource = dataSet;
                GVItems.DataBind();
            } catch (Exception ex)
            {
                Debug.Write("ERROR!!!!: ");
                Debug.WriteLine(ex);
            } finally
            {
                connection.Close();
            }
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(SearchTerm.Text)) return;

            Response.Redirect($"~/Ventas/AgregarArticulo.aspx?searchTerm={SearchTerm.Text}");
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Ventas/AgregarArticulo.aspx");
        }

        protected void GVItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            switch (e.CommandName)
            {
                case "AddToCart":
                    AddToCart(rowIndex);
                    break;
            }
        }

        private void AddToCart(int rowIndex)
        {
            GridViewRow row = GVItems.Rows[rowIndex];
            List<Dictionary<string, object>> products = new List<Dictionary<string, object>>();
            int productID = int.Parse(GVItems.DataKeys[rowIndex].Value.ToString());

            bool productAlreadyAdded = false;
            if (Session["Cart"] != null)
            {
                products = (List<Dictionary<string, object>>)Session["Cart"];
                productAlreadyAdded = products.FindIndex(dict => (int)dict["idProducto"] == productID) >= 0;
            }    

            if (productAlreadyAdded)
            {
                Response.Redirect("~/Ventas/Ventas.aspx");
                return;
            }

            Dictionary<string, object> product = new Dictionary<string, object>() {
                { "idProducto", productID },
                { "Producto", row.Cells[1].Text },
                { "Cantidad", 1 },
                { "Precio", decimal.Parse(row.Cells[3].Text) },
                { "Total", row.Cells[3].Text },
                { "CantidadDisponible", row.Cells[2].Text },
            };

            products.Add(product);
            Session["Cart"] = products;
            Response.Redirect("~/Ventas/Ventas.aspx");
        }

        protected void GVItems_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int quantity = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "CantidadDisponible"));
                Button btnAddToCart = (Button)e.Row.FindControl("btnAddToCart");

                if (quantity < 1)
                {
                    btnAddToCart.Enabled = false;
                }
            }
        }
    }
}