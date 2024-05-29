<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarCliente.aspx.cs" Inherits="SistemaInventarioVentas.Cliente.AgregarCliente" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <!--referencia a bootstrap--> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <div class="container d-flec justify-content-center">
        <div class="col-8">
            <div class="card card-header">
                <h3 class="text-center">Agregar Cliente</h3>
            </div>
            <div class="form-control card card-body">
                <fieldset>

                    <div class="input-group">
                        <asp:Label ID="LblDUI" runat="server" Text="DUI del Cliente" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtDUI" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                        <!--validaciones -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" ControlToValidate="TextDUI" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <br />
                    <div class="input-group">
                        <asp:Label ID="Label1" runat="server" Text="Nombre Cliente" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtNombreC" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                        <!--validaciones -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" ControlToValidate="TxtNombreC" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    <br />

                    <div class="input-group">
                        <asp:Label ID="Label2" runat="server" Text="Telefono" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtTelefono" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox><asp:RangeValidator runat="server" ControlToValidate="TxtTelefono" ErrorMessage="Ingrese bien los Números" MaximumValue="9" ForeColor="Red" MinimumValue="0" Display="Dynamic"></asp:RangeValidator>
                        <!--validaciones -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ControlToValidate="TxtTelefono" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Telefono ya existente" ControlToValidate="TxtTelefono" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>
                    </div>

                    <br />
                    <div class="input-group">
                        <asp:Label ID="Label3" runat="server" Text="Email" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtEmail" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                        <!-- validaciones -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo requerido" ControlToValidate="TxtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de correo no valido" ControlToValidate="TxtEmail" ValidationExpression="^[\w-\.]+@([\wx-]+\.)+[\w-]{2,4}$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Por favor, Ingrese una direccion de correo electronico valida" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>

                    <br />
                    <div class="input-group">
                        <asp:Label ID="Label4" runat="server" Text="Direccion" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtDireccion" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                        <!--validaciones -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" ControlToValidate="TxtDireccion" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                </fieldset>

                <br />
                <div class="conteiner d-flex justify-content-center">
                    <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
                </div>

                <br />
                <div class="conteiner d-flex justify-content-center">
                    <asp:Button ID="BtnAgregar" runat="server" Text="Agregar" CssClass="btn btn-outline-info" ForeColor="#00CCFF" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
