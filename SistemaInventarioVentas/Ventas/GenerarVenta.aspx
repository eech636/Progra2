<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenerarVenta.aspx.cs" Inherits="SistemaInventarioVentas.Ventas.GenerarVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <div>
            <h2>Generar Venta</h2>
        <table>
            <tr>
                <td class="auto-style1">Nombre del Artículo:</td>
                <td class="auto-style1"><asp:TextBox ID="TxtNombreArticulo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidatorNombre" runat="server" ControlToValidate="TxtNombreArticulo" ErrorMessage="Este campo es obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Precio:</td>
                <td><asp:TextBox ID="TxtPrecio" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidadorPrecio" runat="server" ControlToValidate="TxtPrecio" ErrorMessage="Este campo es obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Cantidad De Articulos:</td>
                <td><asp:TextBox ID="TxtCantidadArticulos" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidatorCantidad" runat="server" ControlToValidate="TxtCantidadArticulos" ErrorMessage="Este campo es obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LbTotalVenta" runat="server" Text="Total de la venta"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LbFecha" runat="server" Text="Fecha"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                </td>
            </tr>
        </table>
        </div>
        <asp:Button ID="BtnGenerarVenta" runat="server" Text="Generar Venta" />
</asp:Content>
