<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="SistemaInventarioVentas.Cliente.Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h1>Registro de Clientes</h1>
                    <asp:HyperLink ID="HLinkAgregarUsuario" runat="server" NavigateUrl="~/Cliente/AgregarCliente.aspx" CssClass="btn btn-success">
                        Agregar Cliente
                    </asp:HyperLink>
                </div>
                    <br />
            <div class="container">
                <asp:GridView  ID="GdvClientes" CssClass="table table-light table-hover text-center"   runat="server"> 
                    <Columns>
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <div class="d-flex ps-2 pe-2">
                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger prueba me-2" OnClick="btnEliminar_Click"/>
                                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-success prueba me-2" OnClick="btnActualizar_Click"/>                                        
                                </div>                                        
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <nav>
                    <ul class="pagination">
                        <%  for (int currentPage = 1; currentPage <= totalPaginas; currentPage++)
                            {  %>
                        <li class="page-item"><a class="page-link" href="?page=<%= currentPage %>"><%= currentPage %></a></li>
                        <% }  %>
                    </ul>
                </nav>
            </div>
        </div>
</asp:Content>