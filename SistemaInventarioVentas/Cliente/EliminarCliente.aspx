<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarCliente.aspx.cs" Inherits="SistemaInventarioVentas.Cliente.EliminarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <!--referencia a bootstrap--> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <div class="container">
      <div class="col-6 mx-auto">
          <h2 class="text-center">Eliminar Producto</h2>
          <asp:GridView ID="GridViewCliente" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered">
              <Columns>
                  <asp:BoundField DataField="NombreCliente" HeaderText="Nombre" HeaderStyle-CssClass="text-center" />
                   <asp:BoundField DataField="TelefonoCliente" HeaderText="Telefono" HeaderStyle-CssClass="text-center" />
                  <asp:BoundField DataField="CorreoCliente" HeaderText="Correo" HeaderStyle-CssClass="text-center"/>
                   <asp:BoundField DataField="Direccion" HeaderText="Dirrecion" HeaderStyle-CssClass="text-center"/> 
             
              </Columns>
          </asp:GridView>
          <div class="text-center">
              <asp:Button ID="BtnEliminarCliente" runat="server" Text="Eliminar" OnClick="BtnEliminarCliente_Click" CssClass="btn btn-danger" />
              <a href="Cliente.aspx" class="btn btn-outline-primary" > Regresar al menu  </a>
          </div>
      </div>
  </div>
</asp:Content>