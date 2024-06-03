<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="HistoricoVenta.aspx.cs" Inherits="SistemaInventarioVentas.Ventas.HistoricoVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink runat="server" Text="Regresar" NavigateUrl="~/Ventas/Ventas.aspx" CssClass="btn btn-outline-secondary me-4 rounded-1" /> 
    <h5 class="text-center">HISTORICO DE VENTAS</h5>

    <asp:GridView runat="server" ID="GVVentas" CssClass="table table-light table-hover text-center" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="idVenta" HeaderText="Id"/>
            <asp:BoundField DataField="CreadaPor" HeaderText="Vendido Por"/>
            <asp:BoundField DataField="DUI" HeaderText="DUI Cliente"/>
            <asp:BoundField DataField="FechaVenta" HeaderText="Fecha de Venta"/>
            <asp:BoundField DataField="Total" HeaderText="Total"/>
        </Columns>
    </asp:GridView>

</asp:Content>
