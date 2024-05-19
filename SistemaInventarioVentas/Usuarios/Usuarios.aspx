<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <div>
            <h1>Registro de Usuarios</h1>
            <table class="auto-style1" >
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkRegistroUsuario" runat="server" NavigateUrl="~/Usuarios/AgregarUsuario.aspx" Font-Size="Larger" style="text-decoration:none" color="black">Agregar Usuario</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkModificarUsuario" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Usuarios/ModificarUsuario.aspx">modificar Usuario</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HlinkEliminarUsuario" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Usuarios/EliminarUsuario.aspx">Eliminar Usuario</asp:HyperLink>
                    </td>
                </tr>
            </table>
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