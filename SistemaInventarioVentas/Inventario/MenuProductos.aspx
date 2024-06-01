<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuProductos.aspx.cs" Inherits="SistemaInventarioVentas.Inventario.MenuProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <h1>Administrar Productos</h1>
            <table class="auto-style1 w-100 mb-4  "  >
             
                <tr>
                <td class="auto-style2 d-flex  ">
                    <asp:TextBox ID="TxtBuscar" CssClass="form-control" runat="server" placeholder="Buscar producto..."></asp:TextBox>
                    <asp:Button ID="BtnBuscar" CssClass="btn btn-primary" runat="server" Text="Buscar Producto" OnClick="BtnBuscar_Click"  />
                    <asp:Label ID="LblMensaje" runat="server" Visible="false" ForeColor="Red" style="text-align: center;"></asp:Label>
                </td>
                    <td class="auto-style3 align-right" style="width:210px">
                        <asp:HyperLink ID="HlAgregarProducto" CssClass="btn btn-primary ms-auto" runat="server"  Style="text-decoration: none" color="black" NavigateUrl="~/Inventario/AgregarProductos.aspx">Agregar Nuevo Producto</asp:HyperLink>
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
                 <td style="width:200px" >
                     <a href='<%= "ModificarProductos.aspx?id=" + item["IdProducto"] %>' class="btn btn-primary">Modificar</a>
                     <a href='<%= "EliminarProducto.aspx?id=" + item["IdProducto"] %>' class="btn btn-danger">Eliminar</a>
                     
                 </td>
                 
               
             </tr>
             <% }  %>
           </tbody>
     </table>
     <nav>
       <ul class="pagination">
         <%  for (int currentPage = 1; currentPage<= totalPaginas; currentPage++)  {  %>
         <li class="page-item"><a class="page-link" href="?page=<%= currentPage %>"><%= currentPage %></a></li>
         <% }  %>
       </ul>
     </nav>
 </div>




        </div>
</asp:Content>
