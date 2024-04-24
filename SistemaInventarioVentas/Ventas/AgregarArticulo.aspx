<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarArticulo.aspx.cs" Inherits="SistemaInventarioVentas.Ventas.AgregarArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
             <h2>Agregar Artículo</h2>
        <table>
            <tr>
                <td>Código del Artículo:</td>
                <td><asp:TextBox ID="txtCodigo" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidadorCodigoArticulo" runat="server" ControlToValidate="txtCodigo" ErrorMessage="Este campo es obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Nombre del Artículo:</td>
                <td><asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>   
                    <asp:RequiredFieldValidator ID="ValidadorNombreArticulo" runat="server" ControlToValidate="txtNombre" ErrorMessage="Este campo es obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Precio:</td>
                <td><asp:TextBox ID="txtPrecio" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidadorPrecio" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Este campo es obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Cantidad Disponible:</td>
                <td><asp:TextBox ID="txtCantidad" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidadorCantidad" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Este campo es obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        
            <br />
        </div>
        <asp:Button ID="BtnagregarArticulo" runat="server" Text="Agregar Articulo" />
</asp:Content>
