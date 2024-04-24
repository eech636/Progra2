<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarUsuario.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.ModificarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

                     <h5 class="text-center">Modificar Usuarios</h5>
  <div class=" card card-body bg-info-subtle">
      <fieldset>
          <div>
                <asp:Label ID="label1" runat="server" Text="IdUsuario" cssClass="form-label text-danger fw-bold" ></asp:Label>
                <asp:TextBox ID="TxtIdUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtIdUsuario" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
           </div>
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
              <asp:TextBox ID="TxtBoxRol" runat="server" CssClass="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvRol" runat="server" ControlToValidate="TxtBoxRol" ErrorMessage="Ingrese bien los datos"></asp:RequiredFieldValidator>
          </div>
 
          <div class="my-3">
              <asp:Label ID="LblError" runat="server" Text=" "></asp:Label>
          </div>
          <div class="pt-2">
              <asp:Button ID="BtnModificar" runat="server" Text="Modificar" CssClass="btn btn-outline-primary" OnClick="BtnModificar_Click"/>
          </div>
      </fieldset>
</div>
</asp:Content>          