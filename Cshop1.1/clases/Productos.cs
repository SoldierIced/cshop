using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Cshop1._1.clases
{
    public class Productos
    {
        AccesoDatos aq = new AccesoDatos();
        public string c_articulo = "";
        public string c_tipo = "";
        public string detalle = "";
        public string precio = "";
        public string url = "";
        public string nombre = "";
        string consulta = "";

       public Productos(string tipo, string detalle, string precio, string nombre, string url, string c_articulo="0") {

            this.c_articulo = c_articulo;
            this.c_tipo = tipo;
            this.detalle = detalle;
            this.precio = precio;
            this.url = url;
            this.nombre = nombre;
                }
        public Productos() { }

        public int insert_into()
        {
            url = url.Replace("//", "/");
            consulta = "insert into articulos select '"+c_tipo+"','"+nombre+"','"+detalle+"','"+precio+"','"+url+"'";
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
        public static int consultar_talle(string talle, string c_arti)
        {

            AccesoDatos aq = new AccesoDatos();

            DataTable t = aq.ObtenerTabla("select * from tallesxarticulo where c_articulo= '" + c_arti + "' and c_talle= '" + talle + "'");

            if (t.Rows.Count != 0)
            {

                return 1;
            }


            return -1;
        }


        public int update()
        {

            consulta = " update Articulos set  c_tiporopa = '"+c_tipo+"', detallear = '"+detalle+"', precio = '"+precio+"', ulr='"+url+"' where c_articulo = '"+c_articulo+"'";
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
        /// <summary>
        /// //traigo los datos de dicho articulo.
        /// </summary>
        /// <param name="c_codigo"></param>
        /// <returns></returns>
        public static DataTable datos(string cod) {
            AccesoDatos aq = new AccesoDatos();
            string consulta = "select nombreArt,detallear, precio, url from Articulos where c_articulo = '" + cod + "'";
          return aq.ObtenerTabla(consulta, "Articulos");
        }
        /// <summary>
        /// devuelve array de los nombres  de los  talles del articulo
        /// </summary>
        /// <param name="cod"></param>
        /// <returns> </returns>
        public static DataTable get_talles(string cod) {
            AccesoDatos aq = new AccesoDatos();
            string consulta = "select t.c_talle, talles.detalle from tallesxarticulo as t  inner join talles on t.c_talle=talles.c_talle where c_articulo = '"+cod+"'";
           return aq.ObtenerTabla(consulta);
        }
        /// <summary>
        /// devuelve array de descripciones de los  colores (Color) y las imagenes(Imagen)
        /// </summary>
        /// <param name="cod"></param>
        /// <returns></returns>
        public static DataTable get_colores(string cod)
        {
            AccesoDatos aq = new AccesoDatos();
            string consulta = "select colores.nombre as [Color],colores.url as [imagen], colores.c_color from ColoresxArticulos as c inner join colores on c.c_color= colores.c_color where c_articulo = '"+cod+"'";
            return aq.ObtenerTabla(consulta);
        }

        public static string stock_articulo_xtalle(string art, string talle) {

            AccesoDatos aq = new AccesoDatos();
            string consulta = "select stock from articulosxsucursales where c_articulo='"+art+"' and c_talle='"+talle+"' and baja=0";
            try
            {
                DataTable t = aq.ObtenerTabla(consulta);
                return t.Rows[0][0].ToString();
            }
            catch (Exception)
            {
                return "";
            }
           
        }
    }

}