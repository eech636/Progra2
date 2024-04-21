<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuProductos.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.MenuProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <h1>Administrar Productos</h1>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HlAgregarProducto" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Inventario/AgregarProductos.aspx">Agregar Nuevo Producto</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="HlEliminarProducto" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Inventario/EliminarProducto.aspx">Eliminar Producto</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HlModificarProducto" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Inventario/ModificarProductos.aspx">Modificar Producto</asp:HyperLink>
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
