<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1>Registro de Usuarios</h1>
                <asp:HyperLink ID="HLinkAgregarUsuario" runat="server" NavigateUrl="~/Usuarios/AgregarUsuario.aspx" CssClass="btn btn-success">
                    Agregar Usuario
                </asp:HyperLink>
            </div>
            <br />
            <div class="container">
                        <table class="table">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">IdUsuario</th>
                                    <th scope="col">Nombre Usuario</th>
                                    <th scope="col">Clave</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">IdRol</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  foreach (Dictionary<String, String> item in listausuarios)
                                    {  %>
                                <tr>
                                    <td><%=item["IdUsuario"]%></td>
                                    <td><%=item["NombreUsuario"]%></td>
                                    <td><%=item["Clave"]%></td>
                                    <td><%=item["Email"]%></td>
                                    <td><%=item["IdRol"]%></td>
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
                                <%  for (int currentPage = 1; currentPage <= totalPaginas; currentPage++)
                                    {  %>
                                <li class="page-item"><a class="page-link" href="?page=<%= currentPage %>"><%= currentPage %></a></li>
                                <% }  %>
                            </ul>
                        </nav>
            </div>
        </div>
</asp:Content>