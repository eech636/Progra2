<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenerarVenta.aspx.cs" Inherits="SistemaInventarioVentas.Ventas.GenerarVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <h2>Resumen de Venta</h2>
                <asp:HyperLink runat="server" Text="Regresar" NavigateUrl="~/Ventas/Ventas.aspx" CssClass="btn btn-outline-secondary me-2 mb-3" />
                <asp:GridView ID="GVItems" runat="server" CssClass="table table-borderless mb-0" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="idProducto" Visible="false" />
                        <asp:BoundField DataField="Producto" HeaderText="Producto" ItemStyle-Width="100%" HeaderStyle-CssClass="border-bottom" />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ItemStyle-Width="100%" HeaderStyle-CssClass="text-center px-4 border-bottom" ItemStyle-CssClass="px-4 text-center" />
                        <asp:BoundField DataField="Total" HeaderText="Total" HeaderStyle-CssClass="text-center px-4 border-bottom" ItemStyle-CssClass="px-4 text-center" DataFormatString="{0:C}" />
                    </Columns>
                </asp:GridView>
                <div class="d-flex justify-content-end px-3 fw-bold fs-4 border border-1 border-top-0 mt-0 mb-3">
                    <span class="">TOTAL: $</span>
                    <asp:Label runat="server" ID="LblTotal" Text="0" />
                </div>

                <div class="d-flex justify-content-end">
                    <div class="input-group input-group">
                        <span class="input-group-text" id="inputGroup-sizing-sm">DUI Cliente:</span>
                        <asp:TextBox runat="server" ID="TxtDUICliente" CssClass="form-control" placeholder="00000000-0" />
                    </div>
                    <asp:Button ID="BtnProcess" runat="server" type="submit" CssClass="btn btn-success" Text="Procesar" OnClick="BtnProcess_Click" />
                </div>
                
                <asp:RequiredFieldValidator runat="server" ID="DUIPresenceValidator" ControlToValidate="TxtDUICliente" ErrorMessage="* Numero de DUI requerido" Display="Dynamic" CssClass="text-danger" />
                <asp:RegularExpressionValidator runat="server" ID="DUIRegexValidator" ControlToValidate="TxtDUICliente" ErrorMessage="* Ingrese un numero de DUI valido" Display="Dynamic" CssClass="text-danger" ValidationExpression="^\d{8}-\d{1}$" />
                <asp:CustomValidator runat="server" ID="ValidateDUIExistence" ControlToValidate="TxtDUICliente" ErrorMessage="* El DUI no se encuentra registrado" Display="Dynamic" CssClass="text-danger" OnServerValidate="ValidateDUIExistence_ServerValidate"/>
            </div>
        </div>
    </div>
</asp:Content>
