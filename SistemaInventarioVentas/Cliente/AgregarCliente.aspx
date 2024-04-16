<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarCliente.aspx.cs" Inherits="SistemaInventarioVentas.Cliente.AgregarCliente" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <!--referencia a bootstrap--> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
       
        <div class="container d-flec justify-content-center">
            <div class="col-8" >
                <div class="card card-header">
                   <h3 class="text-center">AGREGAR Cliente</h3>
                </div>
                <div class="form-control card card-body">
                    <fieldset>
                        <div class="input-group">
                            <asp:Label ID="Label1" runat="server" Text="Nombre Cliente" ForeColor="Blue" CssClass="form-control"></asp:Label>
                            <asp:TextBox ID="TxtNombreC" runat="server" ForeColor="#CCFFFF" CssClass="form-control"></asp:TextBox>
                        <!--validaciones -->
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" ControlToValidate="TxtNombreC" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                        </div>
                        <div class="input-group">
                            <asp:Label ID="Label2" runat="server" Text="Telefono" ForeColor="Blue" CssClass="form-control"></asp:Label>
                            <asp:TextBox ID="TxtTelefono" runat="server" ForeColor="#CCFFFF" CssClass="form-control"></asp:TextBox>
                        <!--validaciones -->
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ControlToValidate="TxtTelefono" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                        </div>
                        <div class="input-group">
                            <asp:Label ID="Label3" runat="server" Text="Email" ForeColor="Blue" CssClass="form-control"></asp:Label>
                            <asp:TextBox ID="TxtEmail" runat="server" ForeColor="#CCFFFF" CssClass="form-control" ></asp:TextBox>
                        <!-- validaciones -->
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo requerido" ControlToValidate="TxtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de correo no valido" ControlToValidate="TxtEmail" ValidationExpression="^[\w-\.]+@([\wx-]+\.)+[\w-]{2,4}$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                            
                        </div>
                        <div class="input-group">
                            <asp:Label ID="Label4" runat="server" Text="Direccion" ForeColor="Blue" CssClass="form-control"></asp:Label>
                            <asp:TextBox ID="TxtDireccion" runat="server" ForeColor="#CCFFFF" CssClass="form-control"></asp:TextBox>
                        <!--validaciones -->
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" ControlToValidate="TxtDireccion" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                        </div>
                    </fieldset>

                    <br />
                    <div class="conteiner d-flex justify-content-center">
                        <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label>
                    </div>

                    <br />
                    <div class="conteiner d-flex justify-content-center">
                        <asp:Button ID="BtnAgregar" runat="server" Text="Agregar" CssClass="btn btn-outline-info" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>