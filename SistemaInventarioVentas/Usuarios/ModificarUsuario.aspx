<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarUsuario.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.ModificarUsuario" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container d-flec justify-content-center">
        <div class="col-8">
            <div class="card card-header">
                <h3 class="text-center">Modificar Usuario</h3>
            </div>
            <div class="form-control card card-body">
                <fieldset>
                    <div class="input-group">
                        <asp:Label ID="LblNombreUsuario" runat="server" Text="NombreUsuario" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtBoxNombreUsuario" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                        <!--validaciones-->
                        <asp:RequiredFieldValidator ID="rfvNombreUsuario" runat="server" ControlToValidate="TxtBoxNombreUsuario" ErrorMessage="Ingrese bien los datos" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <br />
                    <div class="input-group">
                        <asp:Label ID="LblClave" runat="server" Text="clave" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtBoxClave" runat="server" ForeColor="#000000" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <!--validaciones-->
                        <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="TxtBoxClave" ErrorMessage="Ingrese bien los datos" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtBoxClave" ErrorMessage="La contraseña debe contener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una letra minúscula y un número" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>

                    <br />
                    <div class="input-group">
                        <asp:Label ID="LblEmail" runat="server" Text="Email" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtBoxEmail" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                        <!--validaciones-->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtBoxEmail" ErrorMessage="Ingrese bien los datos" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="TxtBoxEmail" ErrorMessage="Por favor, Ingrese una direccion de correo electronico valida" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>

                    <br />
                    <div class="input-group">
                        <asp:Label ID="LblRol" runat="server" Text="IdRol" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtBoxRol" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                        <!--validaciones-->
                        <asp:RequiredFieldValidator ID="rfvRol" runat="server" ControlToValidate="TxtBoxRol" ErrorMessage="Ingrese bien los datos" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </fieldset>

                <br />
                <div class="conteiner d-flex justify-content-center">
                    <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
                </div>

                <br />
                <div class="conteiner d-flex justify-content-center">
                    <asp:Button ID="BtnModificar" runat="server" Text="Modificar" CssClass="btn btn-outline-info" OnClick="BtnModificar_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
