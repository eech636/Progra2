<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarProductos.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.AgregarProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <div class="container d-flex justify-content-center">
    <div class="col-7">
        <div class="card card-header  text-black">
            <h3 class="text-center">Agregar Productos</h3>
        </div>
        <div class="card card-body">
            <table class="table table-bordered">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbNombre" runat="server" Text="Nombre del producto"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtNombreArticulo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadarNombreArticulo" runat="server" ControlToValidate="TxtNombreArticulo" ErrorMessage="Este campo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbPrecio" runat="server" Text="Precio"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPrecio" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadarPrecio" runat="server" ControlToValidate="TxtPrecio" ErrorMessage="Este campo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbCantidadDisponible" runat="server" Text="Cantidad disponible"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtCantidadDisponible" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorCantidadDisponible" runat="server" ControlToValidate="TxtCantidadDisponible" ErrorMessage="Este campo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbPrecioCosto" runat="server" Text="Precio Costo"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPrecioCosto" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorPrecioCosto" runat="server" ControlToValidate="TxtPrecioCosto" ErrorMessage="Este campo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="LbDesscripcion" runat="server" Text="Descripción del artículo"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TxtDescricionArticulo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorDescripcion" runat="server" ControlToValidate="TxtDescricionArticulo" ErrorMessage="Este campo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                        <asp:Label ID="LabelMensajeAgregar" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2">
                        <asp:Button ID="BtnGuardarArticulo" runat="server" Text="Guardar" CssClass="btn btn-outline-info d-block mx-auto" OnClick="BtnGuardarArticulo_Click" />
                    </td>
                </tr>
               
            </table>
        </div>
    </div>
</div>

</asp:Content>
