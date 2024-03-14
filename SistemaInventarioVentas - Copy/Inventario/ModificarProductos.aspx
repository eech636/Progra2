<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarProductos.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.ModificarProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <asp:Label ID="LbModificarProducto" runat="server" Font-Size="Larger" Text="Modificar Producto"></asp:Label>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbNombreProducto" runat="server" Text="Ingrese ID producto"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtIdProducto" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorBuscarProducto" runat="server" ControlToValidate="TxtIdProducto" ErrorMessage="Este campo es requerido" ValidationGroup="GrupoValidadorBuscarProducto"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbMensaje" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="BtnModifcarBuscar" runat="server"  Text="Buscar Producto" ValidationGroup="GrupoValidadorBuscarProducto" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="LbModificarPrecio" runat="server" Text="Precio"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtModificarPrecio" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorModificarPrecio" runat="server" ControlToValidate="TxtModificarPrecio" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbModificarCantidadDisponible" runat="server" Text="Cantidad disponible"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtModifcarCantidad" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorCantidadDisponible" runat="server" ControlToValidate="TxtModifcarCantidad" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbModificarDescripcion" runat="server" Text="Descripcion"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtModificarDescripcion" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorDescripcion" runat="server" ControlToValidate="TxtModificarDescripcion" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbMensajeProductoModificado" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="BtnGuardarModificar" runat="server" OnClick="BtnGuardarMoficar_Click" Text="Modificar Producto" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>
