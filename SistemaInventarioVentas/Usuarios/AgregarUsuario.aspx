<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.AgregarUsuario" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container d-flec justify-content-center">
        <div class="col-7">
            <div class="card card-header">
                <h3 class="text-center">Agregar Usuario</h3>
            </div>
            <div class="form-control card card-body">
                <fieldset>
                    <div class="input-group">
                        <asp:Label ID="NombreUsuario" runat="server" Text="NombreUsuario" ForeColor="Blue" CssClass="form-control"></asp:Label>
                        <asp:TextBox ID="TxtBoxNombreUsuario" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                        <!--validaciones-->
                        <asp:RequiredFieldValidator ID="rfvNombreUsuario" runat="server" ControlToValidate="TxtBoxNombreUsuario" ErrorMessage="Ingrese bien los datos" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <br />
                    <div class="input-group">
                        <asp:Label ID="LblClave" runat="server" Text="clave" CssClass="form-control" ForeColor="Blue"></asp:Label>
                        <asp:TextBox ID="TxtBoxClave" runat="server" ForeColor="#000000" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <!--validaciones-->
                        <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="TxtBoxClave" Display="Dynamic" ForeColor="Red" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtBoxClave" ErrorMessage="La contraseña debe contener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una letra minúscula y un número" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>

                    <br />
                    <div class="input-group">
                        <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="form-control" ForeColor="Blue"></asp:Label>
                        <asp:TextBox ID="TxtBoxEmail" runat="server" ForeColor="#000000" CssClass="form-control"></asp:TextBox>
                        <!--validaciones-->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtBoxEmail" ErrorMessage="Ingrese bien los datos" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="TxtBoxEmail" ErrorMessage="Por favor, Ingrese una direccion de correo electronico valida" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>

                    <br />
                    <div class="input-group">
                        <asp:Label ID="LblRol" runat="server" Text="IdRol" CssClass="form-control" ForeColor="Blue"></asp:Label><asp:DropDownList runat="server">
                            <asp:ListItem>Vendedor</asp:ListItem>
                            <asp:ListItem>Administrador</asp:ListItem>
                            <asp:ListItem>Supervisor</asp:ListItem>
                        </asp:DropDownList>
                        
                    
                        
                   
                        </div>
                </fieldset>

                <br />
                <div class="conteiner d-flex justify-content-center">
                    <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
                </div>

                <br />
                <div class="conteiner d-flex justify-content-center">
                    <asp:Button ID="BtnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-outline-info" OnClick="BtnIngresar_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
