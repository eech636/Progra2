using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SistemaInventarioVentas
{
    public class Conexion
    {
        private static Conexion conexion = null;

        private Conexion() { } 

        public static Conexion getInstance()
        {
            if (conexion == null)
            {
                conexion = new Conexion();
            }
            return conexion;
        }
        public SqlConnection ConexionBDProyect()
        {
            
            SqlConnection Conexion = new SqlConnection();
            Conexion.ConnectionString = @"Data Source=ALEJANDRO; Initial Catalog=SistemaInventarioyFacturacion; Integrated Security=true";
            return Conexion; 
        }
    }
}