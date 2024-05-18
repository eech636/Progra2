using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace SistemaInventarioVentas
{
    public class AutenticacionValidador
    {
        public static void ValidacionSesion(Page page)
        {
            if (page.Session["NombreUsuario"] == null)
            {
                page.Response.Redirect("~/Autenticacion/Login.aspx");
            }
        }

        public static void ValidacionPermisos (Page page, string rol)
        {
            if (rol == "ADMIN" && (string)page.Session["NombreRol"] != "ADMIN")
            {
                page.Response.Redirect("~/AboutUs.aspx");
                return;
            }
            if (rol == "SUPERVISOR" && !((string)page.Session["NombreRol"] == "SUPERVISOR" || (string)page.Session["NombreRol"] == "ADMIN"))
            {
                page.Response.Redirect("~/AboutUs.aspx");
                return;
            }
        }
    }
}