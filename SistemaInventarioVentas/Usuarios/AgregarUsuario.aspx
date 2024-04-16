﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.AgregarUsuario" %>
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
                                <asp:Button ID="BtnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-outline-primary" />
                            </div>
                        </fieldset>
                  </div>
</asp:Content>                