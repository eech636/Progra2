<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarProducto.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.EliminarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbEliminarProducto" runat="server" Font-Size="Larger" Text="Eliminar Producto"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbingresarId" runat="server" Text="Ingrese el ID del producto a eliminar"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtIdProducto" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorIdProducto" runat="server" ControlToValidate="TxtIdProducto" ErrorMessage="Este campo es obligatorio"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbMensajeEliminar" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:Button ID="BtnEliminarProducto" runat="server" Text="Eliminar" />
</asp:Content>
