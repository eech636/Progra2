<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarProducto.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.EliminarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
   <div class="container">
        <div class="col-6 mx-auto">
            <h2 class="text-center">Eliminar Producto</h2>
            <asp:GridView ID="GridViewProducto" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="NombreProducto" HeaderText="Nombre" />
                     <asp:BoundField DataField="CantidadDisponible" HeaderText="Cantidad en stock" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                     <asp:BoundField DataField="PrecioCosto" HeaderText="Precio Del Producto" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
            <div class="text-center">
                <asp:Button ID="BtnEliminarProducto" runat="server" Text="Eliminar" OnClick="BtnEliminarProducto_Click" CssClass="btn btn-danger" />
                <a href="MenuProductos.aspx" class="btn btn-outline-primary" > Regresar al menu  </a>
            </div>
        </div>
    </div>
</asp:Content>
