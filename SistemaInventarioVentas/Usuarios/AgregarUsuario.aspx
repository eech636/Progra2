<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.AgregarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

                    <h5 class="text-center">Ingresar Usuarios</h5>
                    <div class=" card card-body bg-info-subtle">
                        <fieldset>
                            <div>
                                <asp:Label ID="LblNombreUsuario" runat="server" Text="NombreUsuario" cssClass="form-label text-danger fw-bold" ></asp:Label>
                                <asp:TextBox ID="TxtBoxNombreUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNombreUsuario" runat="server" ControlToValidate="TxtBoxNombreUsuario" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:Label ID="LblClave" runat="server" Text="clave" cssClass="form-label text-danger fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtBoxClave" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="TxtBoxClave" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtBoxClave" ErrorMessage="La contraseña debe contener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una letra minúscula y un número" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"></asp:RegularExpressionValidator>
                            </div>
                            <div>
                                <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="form-label text-danger fw-bold"></asp:Label>
                                <asp:TextBox ID="TxtBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtBoxEmail" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="TxtBoxEmail" ErrorMessage="Por favor, Ingrese una direccion de correo electronico valida" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"  ></asp:RegularExpressionValidator>
                            </div>
                            <div>
                                <asp:Label ID="LblRol" runat="server" Text="IdRol" CssClass="form-label text-danger fw-bold"></asp:Label>
                                <asp:DropDownList runat="server" ID="DropBoxRol"></asp:DropDownList>
                            </div>
 
                            <div class="my-3">
                                <asp:Label ID="LblError" runat="server" Text=" "></asp:Label>
                            </div>
                            <div class="pt-2">
                                <asp:Button ID="BtnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-outline-primary" OnClick="BtnIngresar_Click" /> 
                               <asp:Button ID="BtnRegresar" runat="server" Text="Regresar al menu" CssClass="btn btn-outline-primary" OnClick="BtnRegresar_Click" CausesValidation="false" />

                            </div>
                            
                            
                        </fieldset>
                  </div>
</asp:Content>                