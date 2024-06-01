<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarCliente.aspx.cs" Inherits="SistemaInventarioVentas.Cliente.EliminarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
      <div class="col-6 mx-auto">
          <h2 class="text-center">Eliminar Cliente</h2>
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