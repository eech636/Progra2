<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuProductos.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.MenuProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <asp:Label ID="LbMenuProductos" runat="server"  Font-Size="X-Large" Text="Productos"  style="display: block; margin: 0 auto; text-align: center;" ></asp:Label>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HlAgregarProducto" runat="server" Font-Size="Large" Font-Underline="False" ForeColor="Black" NavigateUrl="~/Inventario/AgregarProductos.aspx">Agregar Nuevo Producto</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="HlEliminarProducto" runat="server" Font-Size="Large" Font-Underline="False" ForeColor="Black" NavigateUrl="~/Inventario/EliminarProducto.aspx">Eliminar Producto</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HlModificarProducto" runat="server" Font-Size="Large" Font-Underline="False" ForeColor="Black" NavigateUrl="~/Inventario/ModificarProductos.aspx">Modificar Producto</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>
