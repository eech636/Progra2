<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarCliente.aspx.cs" Inherits="SistemaInventarioVentas.Cliente.EliminarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <!--referencia a bootstrap--> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <div class="container d-flec justify-content-center">
        <div class="col-5">
            <div class="card card-header">
                <h3 class="text-center">Eliminar Cliente</h3>
            </div>
            <div class="form card card-body">
                <fieldset>
                    <div class="input-group">
                        <asp:Label ID="Label1" runat="server" Text="Nombre del Cliente:" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtNomCliente" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                    </div>

                    <br />
                    <div class="conteiner d-flex justify-content-center">
                        <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-outline-info"/>
                    </div>

                    <br />
                    <div class="container d-flex justify-content-center">
                        <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>