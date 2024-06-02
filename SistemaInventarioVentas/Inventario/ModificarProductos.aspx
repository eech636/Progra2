<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarProductos.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.ModificarProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

 
<div class="container d-flex justify-content-center">
    <div class="col-7">
        <div class="card card-header text-black">
            <h3 class="text-center">Modificar Producto</h3>
        </div>
        <div class="card card-body">
            <table class="table table-bordered">
                <tr>
                    <td cospa="2" class="auto-style2" >
                         <asp:Label ID="LnModificarNombre" runat="server" Text="Nombre del producto"></asp:Label>
                    </td>
                    <td class="auto-style4">
                            <asp:TextBox ID="TxtModificarNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtModificarNombre" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                       

                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="LbModificarPrecio" runat="server" Text="Precio"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtModificarPrecio" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorModificarPrecio" runat="server" ControlToValidate="TxtModificarPrecio" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td cospa="2" class="auto-style2">
                        <asp:Label ID="LbModificarPrecioCosto" runat="server" Text="PrecioCosto"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtPrecioCosto" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPrecioCosto" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbModificarCantidadDisponible" runat="server" Text="Cantidad disponible"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtModificarCantidad" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorCantidadDisponible" runat="server" ControlToValidate="TxtModificarCantidad" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LbModificarDescripcion" runat="server" Text="Descripción"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtModificarDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidadorDescripcion" runat="server" ControlToValidate="TxtModificarDescripcion" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"  class="text-center">
                        <asp:Label ID="LbMensajeProductoModificado"  runat="server"></asp:Label>
                    </td>
                </tr>
                
            </table>
             <div class="text-center">
                 <asp:Button ID="BtnGuardarModificar" runat="server" Text="Modificar Producto" OnClick="BtnGuardarModificar_Click" CssClass="btn btn-outline-info mr-5" />
                <asp:Button ID="BtnRegresarProducto" runat="server" Text="Regresar al menú" CssClass="btn btn-outline-primary mr-5" OnClick="BtnRegresarProductos_Click" />
             </div>
        </div>
    </div>
</div>
</asp:Content>
