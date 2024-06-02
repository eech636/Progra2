<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="SistemaInventarioVentas.Ventas.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>Ventas De Articulos</h1>
        
        <div class="btn-toolbar py-3">
            <div class="btn-group ms-auto">
                <asp:HyperLink runat="server" Text="Agregar" NavigateUrl="~/Ventas/AgregarArticulo.aspx" CssClass="btn btn-outline-secondary"/>
            </div>
        </div>

        <asp:GridView ID="GVItems" runat="server" CssClass="table table-light table-hover" AutoGenerateColumns="false" OnRowCommand="GVItems_RowCommand">
            <Columns>
                <asp:BoundField DataField="idProducto" Visible="false"/>
                <asp:BoundField DataField="Producto" HeaderText="Producto" ItemStyle-Width="100%" HeaderStyle-CssClass="text-center px-4" ItemStyle-CssClass="px-4 align-middle" />
                <asp:TemplateField HeaderText="Cantidad"  HeaderStyle-CssClass="text-center px-4" ItemStyle-CssClass="px-4">
                    <ItemTemplate>
                        <div class="btn-group">
                            <asp:Button Text="-" runat="server" CssClass="btn btn-primary" CommandName="DecreaseQuantity" CommandArgument='<%# Eval("idProducto") %>'/>
                            <asp:TextBox runat="server" Text='<%# Eval("Cantidad") %>' CssClass="border-0 px-3" Width="50px" OnTextChanged="TxtQuantity_TextChanged" AutoPostBack="true"/>
                            <asp:Button Text="+" runat="server" CssClass="btn btn-primary" CommandName="IncreaseQuantity" CommandArgument='<%# Eval("idProducto") %>'/>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Precio" HeaderText="Precio" HeaderStyle-CssClass="text-center px-4" ItemStyle-CssClass="px-4 align-middle" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Total" HeaderText="Total" HeaderStyle-CssClass="text-center px-4" ItemStyle-CssClass="px-4 align-middle" DataFormatString="{0:C}" />
                <asp:TemplateField HeaderText="Cantidad"  HeaderStyle-CssClass="text-center px-4" ItemStyle-CssClass="px-4">
                    <ItemTemplate>
                        <asp:Button Text="Remover" runat="server" CssClass="btn btn-secondary" CommandName="Remove" CommandArgument='<%# Eval("idProducto") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:Label ID="LblItemsEmpty" Text="No se han agregado productos" runat="server" CssClass="text-center d-block text-secondary bg-light p-3 mb-3" Visible="false" />

        <div class="btn-toolbar">
            <div class="btn-group ms-auto">
                <div class="d-flex justify-content-center align-items-center px-3 fw-bold fs-4 border border-2 bg-light rounded-start">
                    <span class="">TOTAL: $</span>
                    <asp:Label runat="server" ID="LblTotal" Text="0"/>
                </div>
                <asp:Button ID="BtnGenerarVenta" runat="server" type="button" CssClass="btn btn-success" Text="Generar Venta" OnClick="BtnGenerarVenta_Click" />
            </div>
        </div>
    </div>
</asp:Content>