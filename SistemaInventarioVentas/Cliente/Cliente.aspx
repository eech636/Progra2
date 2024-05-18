<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="SistemaInventarioVentas.Cliente.Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <div>
            <h1>Registro de clientes</h1>
            <table class="auto-style1" >
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkAgregarCliente" runat="server" NavigateUrl="~/Cliente/AgregarCliente.aspx" Font-Size="Larger" style="text-decoration:none" color="black">Agregar Cliente</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HLinkModificarCliente" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Cliente/ModificarCliente.aspx">modificar Cliente</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HlinkEliminarVenta" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Cliente/EliminarCliente.aspx">Eliminar Cliente</asp:HyperLink>
                    </td>
                </tr>
            </table>
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