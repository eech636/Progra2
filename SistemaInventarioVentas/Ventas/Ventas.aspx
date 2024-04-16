<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="SistemaInventarioVentas.Ventas.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <div>
            <h1>Ventas De Articulos</h1>
            <table class="auto-style1" >
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkAgregar" runat="server" NavigateUrl="~/Ventas/AgregarArticulo.aspx" Font-Size="Larger" style="text-decoration:none" color="black">Agregar Articulos</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkBuscarArticulo" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Ventas/BuscarArticulo.aspx">Buscar Articulo</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HlinkGenerarVenta" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Ventas/GenerarVenta.aspx">Generar Venta</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>