using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cshop1._1.clases
{
    public class Tiporopa
    {
        private string consulta = "";
        private AccesoDatos aq = new AccesoDatos();
        string codigo = "";
        string detalle = "";


        public Tiporopa(string detalle, string codigo = "")
        {

            this.codigo = codigo;
            this.detalle = detalle;
        }
        public int insert_into()
        {

            consulta = "insert into tiporopa select '" + detalle + "'";
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

            consulta = "update tiporopa set detalle= '" + detalle + "' where c_tiporopa='" + codigo + "'";
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