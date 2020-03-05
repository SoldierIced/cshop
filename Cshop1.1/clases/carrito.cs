using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Cshop1._1.clases
{
    public class carrito
    {
        static AccesoDatos aq = new AccesoDatos();
       static string consulta = "";

        public static int cantidadactual(string c_user, string c_art, string c_talle, string c_color) {

            consulta = "select cantidad from articulosseleccionados where c_usuario='" + c_user + "' and c_articulo='" + c_art + "' and c_talle = '" + c_talle + "' and c_color='" + c_color + "'";
          DataTable t =   aq.ObtenerTabla(consulta);
            try
            {
                return int.Parse(t.Rows[0][0].ToString());
            }
            catch (Exception)
            {

                return 0;
            }

        }

        static public void insert(string c_user,string c_art,string c_talle, string c_color, string cantidad) {

            try
            {
                consulta = "insert into articulosseleccionados select '" + c_user + "','" + c_art + "','" + c_talle + "','" + c_color + "'," + cantidad + ",GETDATE()";
                aq.aplicarconsultasql(consulta);
              
            }
            catch (Exception ex)
            {
                int cantidadtotal =int.Parse(cantidad) + carrito.cantidadactual( c_user,  c_art,  c_talle,  c_color);
                consulta = "update articulosseleccionados set cantidad="+cantidadtotal+ " , fecha = GETDATE() where c_usuario='" + c_user + "' and c_articulo='" + c_art + "' and c_talle = '" + c_talle + "' and c_color='" + c_color + "'";
                aq.aplicarconsultasql(consulta);
              
            }

        }
        static public DataTable traer(string c_user) {
            
                consulta = "select * from articulosseleccionados where c_usuario = '" + c_user + "'";
                return aq.ObtenerTabla(consulta);
        }

        static public void borrar(string c_user, string c_art, string c_talle, string c_color ) {

            try
            {
                consulta = "insert into historico select '" + c_user + "','" + c_art + "','" + c_talle + "','" + c_color + "'," + cantidadactual(c_user, c_art, c_talle, c_color) + ",GETDATE()";
                aq.aplicarconsultasql(consulta);

            }
            catch (Exception)
            {
                int cantidadtotal = cantidadactual(c_user, c_art, c_talle, c_color) + carrito.cantidadactual(c_user, c_art, c_talle, c_color);
                consulta = "update historico set cantidad=" + cantidadtotal + " , fecha = GETDATE() where c_usuario='" + c_user + "' and c_articulo='" + c_art + "' and c_talle = '" + c_talle + "' and c_color='" + c_color + "'";
                aq.aplicarconsultasql(consulta);

            }
            consulta = "delete articulosseleccionados  where c_usuario='" + c_user + "' and c_articulo='" + c_art + "' and c_talle = '" + c_talle + "' and c_color='" + c_color + "'";
            aq.aplicarconsultasql(consulta);


        }

        static public void comprar_fact(string usuario) {

            //facturas
            try
            {
                consulta = "insert into facturas select '" + usuario + "',GETDATE(),'WEB' ";
                aq.aplicarconsultasql(consulta);
            }
            catch (Exception ex)
            {

            }

        }
        static public void comprar_detalle_fact(string user,string talle, string art, string color, string precio, string cantidad)
        {
            string fact = "";
            try
            {
                consulta = "select max(c_factura)from facturas";
          DataTable t =       aq.ObtenerTabla(consulta);
            fact =     t.Rows[0][0].ToString();
            }
            catch (Exception)
            {
            }

            //facturas
            try
            {
                precio = precio.Replace(",", ".");
                consulta = "insert into detallefactura select '"+fact+"','"+user+"','"+talle+"','"+art+"','"+color+"',"+precio+","+cantidad;
                aq.aplicarconsultasql(consulta);
            }
            catch (Exception)
            {
            }

        }

    }
}