<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <div>
            <h1>Registro de Usuarios</h1>
            <table class="auto-style1" >
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkRegistroUsuario" runat="server" NavigateUrl="~/Usuarios/AgregarUsuario.aspx" Font-Size="Larger" style="text-decoration:none" color="black">Agregar Usuario</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkModificarUsuario" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Usuarios/ModificarUsuario.aspx">modificar Usuario</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HlinkEliminarUsuario" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Usuarios/EliminarUsuario.aspx">Eliminar Usuario</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>