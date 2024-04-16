<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarUsuario.aspx.cs" Inherits="SistemaInventarioVentas.Usuario.EliminarUsuario" %>

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
                    <h5 class="text-center">Eliminar Usuarios</h5>
                       </div>
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
          </div>
     </div>
        </form>
 </body>
</html>