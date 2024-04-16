<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarUsuario.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.EliminarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

                    <h5 class="text-center">Eliminar Usuarios</h5>               
                    <div class=" card card-body bg-success-subtle">
                        <fieldset>
                            <div>
                                <asp:Label ID="LblIdUsuario" runat="server" Text="IdUsuario" cssClass="form-label text-danger fw-bold" ></asp:Label>
                                <asp:TextBox ID="TxtBoxIdUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvIdUsuario" runat="server" ControlToValidate="TxtBoxIdUsuario" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-outline-danger"/>
                            </div>
                            </fieldset>
                 </div>

</asp:Content> 