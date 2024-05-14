<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarProducto.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.EliminarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <div class="container">
    <div class="col-6 mx-auto">
        <h2 class="text-center">Eliminar Producto</h2>
        <table class="table table-bordered">
            <tr>
                <td>
                    <asp:Label ID="LbingresarId" runat="server" Text="Ingrese el ID del producto a eliminar"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtIdProducto" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidadorIdProducto" runat="server" ControlToValidate="TxtIdProducto" ErrorMessage="Este campo es obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Label ID="LbMensajeEliminar" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                     <asp:Button ID="BtnEliminarProducto" runat="server" Text="Eliminar" OnClick="BtnEliminarProducto_Click" CssClass="btn btn-outline-info d-block mx-auto" />
                </td>
            </tr>
        </table>
    </div>
</div>

</asp:Content>
