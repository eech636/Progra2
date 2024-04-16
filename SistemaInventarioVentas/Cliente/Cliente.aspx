<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="SistemaInventarioVentas.Cliente.Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <div>
            <h1>Registro de clientes</h1>
            <table class="auto-style1" >
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkAgregarCliente" runat="server" NavigateUrl="~/Cliente/AgregarCliente.aspx" Font-Size="Larger" style="text-decoration:none" color="black">Agregar Cliente</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkModificarCliente" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Cliente/ModificarCliente.aspx">modificar Cliente</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HlinkEliminarVenta" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Cliente/EliminarCliente.aspx">Eliminar Cliente</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>