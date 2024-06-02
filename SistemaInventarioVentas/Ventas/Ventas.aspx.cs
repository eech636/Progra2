using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioVentas.Ventas
{
    public partial class Ventas : System.Web.UI.Page
    {
        List<Dictionary<string, object>> products = new List<Dictionary<string, object>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            AutenticacionValidador.ValidacionSesion(this);

            if (Session["Cart"] != null)
                products = (List<Dictionary<string, object>>)Session["Cart"];

            if (!IsPostBack)
            {
                LoadItems();
            }  
        }

        protected void LoadItems()
        {
            if (products.Count == 0)
            {
                BtnGenerarVenta.Enabled = false;
                LblItemsEmpty.Visible = true;
            }

            DataTable items = ConvertToDataTable(products);
            GVItems.DataSource = items;
            GVItems.DataBind();
            LblTotal.Text = GetTotal().ToString();
        }

        protected void GVItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int itemID = Convert.ToInt32(e.CommandArgument.ToString());
            
            switch (e.CommandName)
            {
                case "Remove":
                    RemoveItem(itemID);
                    break;

                case "IncreaseQuantity":
                    IncreaseQuantity(itemID);
                    break;
                case "DecreaseQuantity":
                    DecreaseQuantity(itemID);
                    break;
            }
            Session["Cart"] = products;
            LoadItems();
        }

        protected void IncreaseQuantity(int itemID)
        {
            int productIndex = products.FindIndex(dict => (int)dict["idProducto"] == itemID);
            Debug.WriteLine($"HEREEE!!!!!!!! {products[productIndex]["CantidadDisponible"]}");
            int cantidadDisponible = int.Parse(products[productIndex]["CantidadDisponible"].ToString());
            int cantidadARestar = (int)products[productIndex]["Cantidad"] + 1;
            if (cantidadARestar > cantidadDisponible)
                return;


            if (productIndex >= 0)
                UpdateQuantity(productIndex, (int)products[productIndex]["Cantidad"] + 1);
        }

        protected void DecreaseQuantity(int itemID)
        {
            int productIndex = products.FindIndex(dict => (int)dict["idProducto"] == itemID);
            if (productIndex < 0)
                return;

            int currentQuantity = (int)products[productIndex]["Cantidad"];
            UpdateQuantity(productIndex, currentQuantity - 1);
        }

        protected void UpdateQuantity(int productIndex, int newQuantity)
        {
            if (newQuantity < 1 || newQuantity > int.Parse(products[productIndex]["CantidadDisponible"].ToString()))
                return;

            products[productIndex]["Cantidad"] = newQuantity;
            products[productIndex]["Total"] = newQuantity * decimal.Parse(products[productIndex]["Precio"].ToString());
        }

        protected void RemoveItem(int itemID)
        {
            int productIndex = products.FindIndex(dict => (int)dict["idProducto"] == itemID);
            if (productIndex >= 0)
               products.RemoveAt(productIndex);
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

        protected void TxtQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox textBox = sender as TextBox;
            GridViewRow row = textBox.NamingContainer as GridViewRow;
            int newQuantity = 1;
            try
            {
                newQuantity = int.Parse(textBox.Text);
            } catch (Exception ex)
            {
                Debug.WriteLine(ex);
            }

            UpdateQuantity(row.RowIndex, newQuantity);
            Session["Cart"] = products;
            LoadItems();
        }

        protected decimal GetTotal()
        {
            if (products.Count == 0) return 0m;

            return products.Sum(dict => Convert.ToDecimal(dict["Total"]));
        }

        protected void BtnGenerarVenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ventas/GenerarVenta.aspx");
        }
    }
}