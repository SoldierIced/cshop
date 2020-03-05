using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


namespace Cshop1._1.clases
{
    public class Colores
    {
        private string consulta = "";
        private AccesoDatos aq = new AccesoDatos();
        string nombre = "";
        string codigo = "";
        string url = "";


        public Colores(string nombre, string url,string codigo="") {

            this.nombre = nombre;
            this.url = url;
           this.codigo = codigo;
        }

        public int insert_into() {

            consulta = "insert into colores select '" + nombre + "','" + url + "'";
            try
            {   aq.aplicarconsultasql(consulta);
                return 1;
            }
            catch (Exception)
            {
                return -1;
            }
                    
        }
        public int  update() {

            consulta = "update colores set nombre= '" + nombre + "',url='" + url + "' where c_color='"+codigo+"'";
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

       public static int verificarcolor(string codigoart,string color)
        {
            AccesoDatos aq = new AccesoDatos();

            DataTable dt = aq.ObtenerTabla("select c_color from coloresxarticulos where c_articulo = '" + codigoart + "'");

            for (int a = 0; a < dt.Rows.Count; a++)
            {
                if (dt.Rows[a][0].ToString() == color) {
                    return 1;
                }
            }


            return -1;
        }


    }
}