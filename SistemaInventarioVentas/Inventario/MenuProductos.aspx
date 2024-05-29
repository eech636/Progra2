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
                <td class="auto-style2">
                    <asp:TextBox ID="TxtBuscar" runat="server" placeholder="Buscar producto..."></asp:TextBox>
                    <asp:Button ID="BtnBuscar" runat="server" Text="Buscar Producto" OnClick="BtnBuscar_Click"  />
                    <asp:Label ID="LblMensaje" runat="server" Visible="false" ForeColor="Red" style="text-align: center;"></asp:Label>
                </td>
                </tr>      
            </table>
             
          

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
               <th scope="col">Acciones</th>
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
                 <td>
                     <a href='<%= "ModificarProductos.aspx?id=" + item["IdProducto"] %>' class="btn btn-primary">Modificar</a>

                     
                 </td>
                 <td>
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
