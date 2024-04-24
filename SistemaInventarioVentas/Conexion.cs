﻿using System;
using System.Collections.Generic;
using System.Configuration;
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
            Conexion.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            return Conexion; 
        }
    }
}