<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarCliente.aspx.cs" Inherits="SistemaInventarioVentas.Cliente.EliminarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main id="contenido" class="height-contenido width-contenido">
    <div class="d-flex justify-content-center align-items-center mt-5">
        <div class="col-11 col-md-8 rounded shadow p-3 p-sm-4">
            <div>
                <h2 class="text-center">Eliminar Cliente</h2>
                <hr />

                <p class="text-center">¿Estas seguro de eliminar este cliente?</p>

                <div class="overflow-auto ps-3 pe-3">
                    <asp:GridView ID="GdvClientes" runat="server" CssClass="table table-light table-bordered table-hover text-center"></asp:GridView>
                </div>
                
                <!--label por si existe algun error o confirmacion de proceso-->
                <div class="mt-3 mb-5" >
                    <asp:Label ID="lblMensaje" CssClass="d-block w-100" runat="server" Text=""></asp:Label>
                </div>
                <!--Grupo de botones para ingresar, limpiar campos y regresar a la tabla-->
                <div>
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click"/>
                    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-outline-secondary opacity-75" OnClick="btnRegresar_Click"/>
                </div>
            </div>
        </div>
    </div>
</main>
</asp:Content>