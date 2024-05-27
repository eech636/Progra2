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
                    <table class="table">
                          <thead class="table-light">
                            <tr>
                              <th scope="col">DUI</th>
                              <th scope="col">Nombre Cliente</th>
                              <th scope="col">Telefono Cliente</th>
                              <th scope="col">Correo Cliente</th>
                              <th scope="col">Direccion</th>
                              <th scope="col">Acciones</th>
                            </tr>
                          </thead>
                          <tbody>
                            <%  foreach (Dictionary<String, String> item in listacliente)  {  %>
                            <tr>
                                <td><%=item["DUI"]%></td>
                                <td><%=item["NombreCliente"]%></td>
                                <td><%=item["TelefonoCliente"]%></td>
                                <td><%=item["CorreoCliente"]%></td>
                                <td><%=item["Direccion"]%></td>
                                <td>
                                        <!-- Botones de Modificar y Eliminar -->
                                        <button type="button" class="btn btn-primary">Modificar</button>
                                        <button type="button" class="btn btn-danger">Eliminar</button>
                                </td>
                            </tr>
                            <% }  %>
                          </tbody>
                    </table>
                    <nav>
                      <ul class="pagination">
                        <%  for (int currentPage = 1; currentPage<= totalPaginas; currentPage ++)  {  %>
                        <li class="page-item"><a class="page-link" href="?page=<%= currentPage %>"><%= currentPage %></a></li>
                        <% }  %>
                      </ul>
                    </nav>
                </div>
        </div>
</asp:Content>