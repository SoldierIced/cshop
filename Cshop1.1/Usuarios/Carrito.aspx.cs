using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Cshop1._1
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {

        DataTable tablaTemporal;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarTabla();

            }
        }
        public DataTable rearmartabla(string user)
        {

            if (this.Session["user"] != null)
            {

                string consulta = " select a.c_articulo,at.c_talle,at.c_color, a.nombreArt as [Articulo],a.detallear as [Detalle],c.nombre as [color], t.detalle as [talle],a.precio,at.cantidad from articulosseleccionados as at inner join Articulos as a on at.c_articulo = a.c_articulo inner join colores as c on at.c_color = c.c_color inner join talles as t on at.c_talle = t.c_talle where c_usuario = '" + user + "'";
                AccesoDatos aq = new AccesoDatos();
                return aq.ObtenerTabla(consulta);
            }

            return new DataTable();


        }
        public void cargarTabla()
        {
            if (this.Session["user"] != null)
            {
                Usuario u = (Usuario)this.Session["user"];

                // codigo del usuario activo.}
                string user = u.get_codigo().ToString();



                //tabla hermosa y sensual para que tu tabla de carrito no implosione
                DataTable t = rearmartabla(user);
                for (int i = 0; i < t.Rows.Count; i++)
                {
                    float val = float.Parse(t.Rows[i]["precio"].ToString()) * int.Parse(t.Rows[i]["cantidad"].ToString());
                    t.Rows[i]["precio"] = val.ToString();
                }

                if (t.Rows.Count != 0)
                {
                    tablaTemporal = t;
                    GridView1.DataSource = tablaTemporal;
                    //ENLAZO LO QUE CAPTURE EN EL DATASOURCE A EL DATABIND para que se muestre
                    GridView1.DataBind();
                    vaciarCarrito.Visible = true;
                    MensajeCarroVacio.Visible = false;
                    carritoVacio.Visible = false;
                    vaciar.Visible = true;
                    btn_comprar.Visible = true;
                    vaciarCarrito.ImageUrl = "\\images\\vaciarcarrito.png";
                    vaciarCarrito.DataBind();
                }
                else
                {
                    //en caso de que este vacia muestro mensaje de informacion
                    carritoVacio.ImageUrl = "\\images\\carrito_vacio.png";
                    carritoVacio.DataBind();
                    carritoVacio.Visible = true;
                    vaciar.Visible = false;
                    btn_comprar.Visible = false;
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    vaciarCarrito.Visible = false;
                    MensajeCarroVacio.Visible = true;

                }
            }

        }

        protected void vaciarCarrito_Click(object sender, ImageClickEventArgs e)
        {
            Usuario user = (Usuario)this.Session["user"];
            string c_user = user.get_codigo().ToString();
            DataTable datospuros = clases.carrito.traer(c_user);
            DataTable t = rearmartabla(c_user);
            for (int i = 0; i < t.Rows.Count; i++)
            {

                if (((CheckBox)GridView1.Rows[i].FindControl("cb_select")).Checked == true)
                {
                    for (int x = 0; x < datospuros.Rows.Count; x++)
                    {
                        string art = datospuros.Rows[x]["c_articulo"].ToString();
                        string usuario = datospuros.Rows[x]["c_usuario"].ToString();
                        string tall = datospuros.Rows[x]["c_talle"].ToString();
                        string color = datospuros.Rows[x]["c_color"].ToString();
                        if (art == t.Rows[i]["c_articulo"].ToString() &&
                            tall == t.Rows[i]["c_talle"].ToString() &&
                            color == t.Rows[i]["c_color"].ToString())
                        {

                            clases.carrito.borrar(usuario, art, tall, color);
                        }
                    }

                }


            }
            Response.Redirect(gl.carrito);

        }

        protected void btn_comprar_Click(object sender, EventArgs e)
        {
            Usuario user = (Usuario)this.Session["user"];
            string c_user = user.get_codigo().ToString();
            DataTable datospuros = clases.carrito.traer(c_user);
            DataTable t = rearmartabla(c_user);
            int facturar = 0;
            bool creado = false;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                if (((CheckBox)GridView1.Rows[i].FindControl("cb_select")).Checked == true)
                {
                        string usuario = datospuros.Rows[i]["c_usuario"].ToString();
                    if (creado == false) { 
                    clases.carrito.comprar_fact(usuario);
                    }
                    creado = true;
                    for (int x = 0; x < datospuros.Rows.Count; x++)
                    {
                        string art = datospuros.Rows[x]["c_articulo"].ToString();
                        string tall = datospuros.Rows[x]["c_talle"].ToString();
                        string color = datospuros.Rows[x]["c_color"].ToString();
                        if (art == t.Rows[i]["c_articulo"].ToString() &&
                            tall == t.Rows[i]["c_talle"].ToString() &&
                            color == t.Rows[i]["c_color"].ToString())
                        {
                            //if (facturar == 0) { 
                              //  facturar = 1;
                            //}
                            clases.carrito.comprar_detalle_fact(usuario,tall,art,color,t.Rows[i]["precio"].ToString(), t.Rows[i]["cantidad"].ToString());
                            clases.carrito.borrar(usuario, art, tall, color);

                        }
                    }

                }
            }

            if (creado == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se ha creado el pedido correctamente')", true);
            }
            cargarTabla();

        }
    }
}
 