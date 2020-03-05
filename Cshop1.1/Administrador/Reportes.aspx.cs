using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Cshop1._1.Administrador
{
    public partial class Reportes : System.Web.UI.Page
    {

        public void loadchart1() {

            //mas vendidos x art
            string consulta = "";
            consulta+= " select sum(cantidad) as total,detallefactura.c_articulo,nombreArt from detallefactura ";
            consulta += " inner join Articulos on Articulos.c_articulo = detallefactura.c_articulo ";
            consulta += " group by detallefactura.c_articulo, nombreArt ";
            DataTable dt= AccesoDatos.ObtenerTabla2(consulta);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                masvendidos.Series["0"].Points.AddXY(dt.Rows[i]["nombreArt"].ToString(), dt.Rows[i]["total"].ToString().Replace(",", "."));
            }

            
            //Chart1.DataSource = AccesoDatos.ObtenerTabla2(consulta);
            //Chart1.DataBind();
            ////mas vendidos x color
           consulta="";
           consulta+=" select sum(cantidad) as total,detallefactura.c_color, colores.nombre from detallefactura ";
           consulta+=" inner join colores on colores.c_color = detallefactura.c_color ";
            consulta += " group by detallefactura.c_color, colores.nombre ";
            dt = AccesoDatos.ObtenerTabla2(consulta);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                masrecaudado.Series["0"].Points.AddXY(dt.Rows[i]["nombre"].ToString(), dt.Rows[i]["total"].ToString().Replace(",", "."));
            }


            ////mas recaudado x art
            consulta ="";
            consulta += "select sum(cantidad * detallefactura.precio) as total,detallefactura.c_articulo,nombreArt from detallefactura ";
             consulta+=" inner join Articulos on Articulos.c_articulo = detallefactura.c_articulo ";
             consulta+=" group by detallefactura.c_articulo, nombreArt ";

            dt = AccesoDatos.ObtenerTabla2(consulta);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                masvendicolor.Series["0"].Points.AddXY(dt.Rows[i]["nombreArt"].ToString(), dt.Rows[i]["total"].ToString().Replace(",","."));
            }
           

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            loadchart1();
        }
    }
}