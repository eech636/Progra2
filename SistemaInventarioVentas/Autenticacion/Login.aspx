<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaInventarioVentas.Autenticacion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--Bootstrap/Javascript CND links -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <scritpt src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></scritpt>
    <!--Bootstrap/Javascript CND links -->
    <!-- Bibliotecas de iconos de Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
    <!-- Bibliotecas de iconos de Font Awesome -->
    <!-- Hoja de estilos personalizada -->
    <link href="../css/Interface.css" rel="stylesheet"/>
    <!--  -->
    <title>Sistema de Control de Datos</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="modal-dialog text-center mt-4">
                <div class="col">
                    <div class="modal-content px-5">
                        <div class="col-12 mt-4">
                            <img src="../img/lg.png" class="card-img-top rounded-circle" alt=".."/>
                        </div>
                        <form id="form1" runat="server">
                            <div class="form-group mt-4" id="user-group">
                                <asp:TextBox ID="txtUsuario" runat="server" type="text" class="form-control" placeholder="Ingrese usuario"/> 
                            </div>                            
                            <div class="form-group my-2" id="pass-group">
                                <asp:TextBox ID="txtPassword" runat="server" type="password" class="form-control" placeholder="Ingrese clave"/>
                            </div>
                            <div class="row">
                                <asp:Label ID="lblError" runat="server" forecolor="Red"/>
                            </div>
                            <div class="container mt-2">
                                <asp:Button runat="server" ID="btnAcceder" class="btn btn-primary mt-2" Text="Acceder" OnClick="btnAcceder_Click"/>
                            </div>
                        </form>
                        <div class="col-12 forgot mt-3">
                            <a href="#">Recuperar Contrasena</a>
                        </div>                    
                        <div class="col-12 forgot mt-3">
                            <a href="#">Registrarse</a>
                        </div>
                        <br />
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
