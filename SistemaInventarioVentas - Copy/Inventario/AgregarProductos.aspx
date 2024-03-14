<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarProductos.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.AgregarProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <asp:Label ID="LbAgregarProducto" runat="server" Text="Agregar Productos" Font-Size="Larger"></asp:Label>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbNombre" runat="server" Text="Nombre del producto"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtNombreArticulo" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadarNombreArticulo" runat="server" ControlToValidate="TxtNombreArticulo" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbPrecio" runat="server" Text="Precio"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPrecio" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadarPrecio" runat="server" ControlToValidate="TxtPrecio" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbCantidadDisponible" runat="server" Text="Cantidad disponible"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtCantidadDisponible" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorCantidadDisponible" runat="server" ControlToValidate="TxtCantidadDisponible" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbPrecioCosto" runat="server" Text="Precio Costo"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPrecioCosto" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorPrecioCosto" runat="server" ControlToValidate="TxtPrecioCosto" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="LbDesscripcion" runat="server" Text="Descripcion del articulo"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TxtDescricionArticulo" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorDescripcion" runat="server" ControlToValidate="TxtDescricionArticulo" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbMensajeGuardado" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="BtnGuardarArticulo" runat="server" Text="Guardar" />
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>
