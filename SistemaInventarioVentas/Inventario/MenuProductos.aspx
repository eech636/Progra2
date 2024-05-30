<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuProductos.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.MenuProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <h1>Administrar Productos</h1>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HlAgregarProducto" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Inventario/AgregarProductos.aspx">Agregar Nuevo Producto</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="HlEliminarProducto" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Inventario/EliminarProducto.aspx">Eliminar Producto</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HlModificarProducto" runat="server" Font-Size="Larger" style="text-decoration:none" color="black" NavigateUrl="~/Inventario/ModificarProductos.aspx">Modificar Producto</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>
            <br />

             <div class="container">
     <table class="table">
           <thead class="table-light">
             <tr>
               <th scope="col">ID Producto</th>
               <th scope="col">Nombre Producto</th>
               <th scope="col">Cantidad Producto</th>
               <th scope="col">Precio Producto</th>
               <th scope="col">Costo Producto</th>
                 <th scope="col">Descripcion</th>
             </tr>
           </thead>
           <tbody>
             <%  foreach (Dictionary<String, String> item in listaProductos)  {  %>
             <tr>
                 <td><%=item["IdProducto"]%></td>
                 <td><%=item["NombreProducto"]%></td>
                 <td><%=item["CantidadDisponible"]%></td>
                 <td><%=item["Precio"]%></td>
                 <td><%=item["PrecioCosto"]%></td>
                 <td><%=item["Descripcion"]%></td>
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
