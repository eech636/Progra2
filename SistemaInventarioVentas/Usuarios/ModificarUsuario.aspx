<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarUsuario.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.ModificarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center">
            <div class="col-8">
                <div class="card card-header">
                    <h5 class="text-center">Modificar Usuario</h5>
                       </div>
                    <div class=" card card-body bg-warning-subtle">
                        <fieldset>
                            <div>
                                <asp:Label ID="LblIdUsuario" runat="server" Text="IdUsuario" cssClass="form-label text-danger fw-bold" ></asp:Label>
                                <asp:TextBox ID="TxtBoxIdUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtBoxIdUsuario" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:Label ID="LblNombreUsuario" runat="server" Text="NombreUsuario" cssClass="form-label text-danger fw-bold" ></asp:Label>
                                <asp:TextBox ID="TxtBoxNombreUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNombreUsuario" runat="server" ControlToValidate="TxtBoxNombreUsuario" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:Label ID="LblClave" runat="server" Text="clave" cssClass="form-label text-danger fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtBoxClave" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="TxtBoxClave" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtBoxClave" ErrorMessage="La contraseña debe contener al menos 8 caracteres, incluyendo al menos una letra mayuscula, una letra minuscula y un numero" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$" ></asp:RegularExpressionValidator>

                            </div>
                            <div>
                                <asp:Label ID="LblNivelUsuario" runat="server" Text="NivelUsuario" CssClass="form-label text-danger fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtBoxNivelUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="TxtBoxNivelUsuario" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="form-label text-danger fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtBoxEmail" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="TxtBoxEmail" ErrorMessage="Por favor, Ingrese una direccion de correo electronico valida" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"  ></asp:RegularExpressionValidator>
                            <div>
                            </div>
                                <asp:Label ID="LblNivel1" runat="server" Text="Nivel1" CssClass="form-label text-danger fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtBoxNivel1" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNivel1" runat="server" ControlToValidate="TxtBoxNivel1" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:Label ID="LblNivel2" runat="server" Text="Nivel2" CssClass="form-label text-danger fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtBoxNivel2" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNivel2" runat="server" ControlToValidate="TxtBoxNivel2" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                            </div>
                           <div>
                                <asp:Label ID="LblNivel3" runat="server" Text="Nivel3" CssClass="form-label text-danger fw-bold"></asp:Label>
                               <asp:TextBox ID="TxtBoxNivel3" runat="server" CssClass="form-control"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="rfvNivel3" runat="server" ControlToValidate="TxtBoxNivel3" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:Button ID="BtnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" />
                            </div>
                        </fieldset>
                  </div>
                 </div>
                </div>
               <div>
              </div>
        </form>
    </body>
</html>
