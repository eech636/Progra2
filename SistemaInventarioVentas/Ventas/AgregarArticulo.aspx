<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarArticulo.aspx.cs" Inherits="SistemaInventarioVentas.Ventas.AgregarArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="input-group mb-3">
                    <asp:HyperLink runat="server" Text="Regresar" NavigateUrl="~/Ventas/Ventas.aspx" CssClass="btn btn-outline-secondary me-4 rounded-1" />
                    <asp:TextBox runat="server" ID="SearchTerm" placeholder="Busqueda..." CssClass="form-control rounded-start"/>
                    <asp:Button ID="BtnClear" runat="server" CssClass="btn btn-outline-secondary" Text="X" Visible="false" OnClick="BtnClear_Click"/>
                    <asp:Button ID="BtnBuscar" runat="server" CssClass="btn btn-outline-secondary" Text="Buscar" OnClick="BtnBuscar_Click"/>
                </div>

                <asp:GridView ID="GVItems" runat="server" CssClass="table table-light table-hover" AutoGenerateColumns="false" OnRowCommand="GVItems_RowCommand" DataKeyNames="idProducto" OnRowDataBound="GVItems_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="idProducto" Visible="false"/>
                        <asp:BoundField DataField="NombreProducto" HeaderText="Producto" HeaderStyle-CssClass="text-center px-4" ItemStyle-CssClass="px-4 align-middle" />
                        <asp:BoundField DataField="CantidadDisponible" HeaderText="Cantidad Disponible" ItemStyle-Width="300px" HeaderStyle-CssClass="text-center px-4" ItemStyle-CssClass="px-4 align-middle text-center" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" ItemStyle-Width="100px" HeaderStyle-CssClass="text-center px-4" ItemStyle-CssClass="px-4 align-middle" />
                        <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="100px" HeaderStyle-CssClass="text-center px-4" ItemStyle-CssClass="px-4">
                            <ItemTemplate>
                                <asp:Button ID="btnAddToCart" Text="Agregar a Venta" runat="server" CssClass="btn btn-secondary" CommandName="AddToCart" CommandArgument='<%# Container.DataItemIndex %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:Label ID="LblItemsEmpty" Text="No se han encontrado productos" runat="server" CssClass="text-center d-block text-secondary bg-light p-3 mb-3" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
