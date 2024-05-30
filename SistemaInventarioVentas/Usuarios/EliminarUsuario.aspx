<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarUsuario.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.EliminarUsuario" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container d-flec justify-content-center">
        <div class="col-5">
            <div class="card card-header">
                <h3 class="text-center">Eliminar Usuario</h3>
            </div>
            <div class="form card card-body">
                <fieldset>
                    <div class="input-group">
                        <asp:Label ID="LblIdUsuario" runat="server" Text="IdUsuario" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtBoxIdUsuario" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                    </div>

                    <br />
                    <div class="conteiner d-flex justify-content-center">
                        <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-outline-danger"/>
                    </div>

                    <br />
                    <div class="container d-flex justify-content-center">
                        <asp:Label ID="LblError" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
