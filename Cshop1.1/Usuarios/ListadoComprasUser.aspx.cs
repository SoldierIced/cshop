using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1.Usuarios
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        AccesoDatos aq = new AccesoDatos();
        DataTable temp;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cargarTabla();
            }
        }

        void cargarTabla()
        {

            Usuario user = (Usuario)this.Session["user"];
            string consulta = "select c_factura as Factura_N, usuarios.nombre as Usuario, fecha, forma_pago as Abona from facturas" +
                " inner join usuarios on facturas.c_usuario = usuarios.C_usuario  where facturas.c_usuario = '" + user.get_codigo() + "'";

            temp  = aq.ObtenerTabla(consulta);
            GridView1.DataSource = temp;
            GridView1.DataBind();
            if (GridView1.Rows.Count <= 0)
            {
                Label2.Text = "No hay pedidos creados.";
                Label2.Visible=true;
            }
            else
            {
                Label2.Visible = false;
            }
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Usuario user = (Usuario)this.Session["user"];

            string consulta = "select c_factura as Factura_N, usuarios.nombre as Usuario, fecha, forma_pago as Abona from facturas" +
           " inner join usuarios on facturas.c_usuario = usuarios.C_usuario  where facturas.c_usuario = '" + user.get_codigo() + "'";

            temp = aq.ObtenerTabla(consulta);

            string idFactura = temp.Rows[e.NewSelectedIndex][0].ToString();

            cargarGrid2(int.Parse(idFactura)); 
            
            
        }
        void cargarGrid2(int idFactura)
        {
            //c_factura, c_usuario,c_talle,c_articulo,c_color, precio,cantidad
            //string consulta2 = "select c_factura AS Factura, c_usuario AS Usuario,c_talle AS Talle,c_articulo  AS Producto," +
            //    "c_color AS Color, precio ,cantidad from detallefactura where c_factura = '" + idFactura + "'";

            string consulta2 = "select c_factura AS Factura_N, usuarios.nombre AS Nombre, usuarios.apellido AS Apellido,Articulos.detallear AS Producto," +
                "colores.nombre AS Color, detallefactura.precio AS Precio, talles.detalle AS Talle,detallefactura.cantidad AS Cantidad from detallefactura inner join" +
                " usuarios on detallefactura.c_usuario = usuarios.C_usuario inner join colores on detallefactura.c_color = colores.c_color " +
                "inner join Articulos on detallefactura.c_articulo = Articulos.c_articulo" +
                " inner join talles on talles.c_talle = detallefactura.c_talle where c_factura = '" + idFactura + "'";
                                 
            temp = aq.ObtenerTabla(consulta2);
            grd_detalle.DataSource = temp;
            grd_detalle.DataBind();
            
        }

    }
}


