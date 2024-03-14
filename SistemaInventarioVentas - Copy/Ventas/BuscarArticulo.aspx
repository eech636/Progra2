<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuscarArticulo.aspx.cs" Inherits="SistemaInventarioVentas.Ventas.BuscarArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
        <h2>Buscar Artículo</h2>
        <table>
            <tr>
                <td>Código del Artículo:</td>
                <td><asp:TextBox ID="txtCodigo" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidadorBuscarArticulo" runat="server" ControlToValidate="txtCodigo" ErrorMessage="Este campo es obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        </div>
            <br />
            <asp:Button ID="BtnBuscarArticulo" runat="server" Text="Buscar Articulo" />
        <br />
        <asp:Label ID="LbResultadoBusqueda" runat="server" Text=""></asp:Label>
</asp:Content>
