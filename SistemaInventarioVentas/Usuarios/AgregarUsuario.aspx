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
                                <asp:Label ID="LblEmail" runat="server" Text="Correo Electrónico:" cssClass="form-label text-danger fw-bold"></asp:Label>
                                <asp:TextBox ID="TextBoxEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator1"  runat="server"  ControlToValidate="TextBoxEmail" ErrorMessage="El correo electrónico es obligatorio."  ForeColor="Red" />
                                <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Formato de correo no válido."  ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" ForeColor="Red" />                                                                                                            
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
                               
                                <a href="Usuarios.aspx" class="btn btn-outline-primary" > Regresar al menu  </a>

                            </div>
                            
                            
                        </fieldset>
                  </div>
</asp:Content>                