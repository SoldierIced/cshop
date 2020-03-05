using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1.Administrador
{
    public partial class ListadoFacturasAdm : System.Web.UI.Page
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

            string consulta = "select c_factura as Factura_N, usuarios.nombre as Usuario, fecha, forma_pago as Abona from facturas" +
               " inner join usuarios on facturas.c_usuario = usuarios.C_usuario";

            temp = aq.ObtenerTabla(consulta);
            grd_listado.DataSource = temp;

            grd_listado.DataBind();

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Usuario user = (Usuario)this.Session["user"];

            string consulta = "select c_factura as Factura_N, usuarios.nombre as Usuario, fecha, forma_pago as Abona from facturas" +
               " inner join usuarios on facturas.c_usuario = usuarios.C_usuario";

            temp = aq.ObtenerTabla(consulta);

            string c_fact = temp.Rows[e.NewSelectedIndex][0].ToString();

            cargarGrid2(int.Parse(c_fact));
        }


        void cargarGrid2(int c_fact)
        {
            string consulta2 = "select c_factura AS Factura_N, usuarios.nombre AS Nombre, usuarios.apellido AS Apellido,Articulos.detallear AS Producto," +
                "colores.nombre AS Color, detallefactura.precio AS Precio, talles.detalle AS Talle,detallefactura.cantidad AS Cantidad from detallefactura inner join" +
                " usuarios on detallefactura.c_usuario = usuarios.C_usuario inner join colores on detallefactura.c_color = colores.c_color " +
                "inner join Articulos on detallefactura.c_articulo = Articulos.c_articulo" +
                " inner join talles on talles.c_talle = detallefactura.c_talle where c_factura = '" + c_fact + "'";
            temp = aq.ObtenerTabla(consulta2);
            grd_detalle.DataSource = temp;
            grd_detalle.DataBind();

        }
    }
}