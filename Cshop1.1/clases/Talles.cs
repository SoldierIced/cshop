using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cshop1._1.clases
{
    public class Talles
    {
        private string consulta = "";
        private AccesoDatos aq = new AccesoDatos();
        string codigo = "";
        string talle = "";


        public Talles( string talle, string codigo = "") {

            this.codigo = codigo;
            this.talle = talle;
        }
        public int insert_into()
        {

            consulta = "insert into talles select '" + talle+ "'";
            try
            {
                aq.aplicarconsultasql(consulta);
                return 1;
            }
            catch (Exception)
            {
                return -1;
            }

        }
        public int update()
        {

            consulta = "update talles set detalle= '" + talle + "' where c_talle='" + codigo + "'";
            try
            {
                aq.aplicarconsultasql(consulta);
                return 1;
            }
            catch (Exception ex)
            {


                return -1;
            }
        }


    }
}