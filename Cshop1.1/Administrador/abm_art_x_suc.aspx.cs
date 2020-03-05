using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1.Administrador
{
    public partial class abm_art_x_suc : System.Web.UI.Page
    {
        int validarartxsuc(string suc, string art, string talle) {
            string cons = "select * from articulosxsucursales where c_articulo =" + art + " and c_sucursal =" + suc + " and c_talle =" + talle;
          DataTable t =  aq.ObtenerTabla(cons);
            if (t.Rows.Count <= 0) {
                return t.Rows.Count;
            }
            if (t.Rows[0]["baja"].ToString() == "1") {

                return 0;
            }
            
            return t.Rows.Count;
 
        }
        AccesoDatos aq = new AccesoDatos();
        void cargargrid() {
            string consulta = "select nombreArt,detalle,ar.c_articulo,ta.c_talle from tallesxarticulo as ta inner join Articulos as ar on ta.c_articulo = ar.c_articulo inner join talles on ta.c_talle=talles.c_talle ";
            gv_arti.DataSource= aq.ObtenerTabla(consulta);
            gv_arti.DataBind();
            string suc = this.Session["sucursal"].ToString();
            DataTable t = aq.ObtenerTabla(consulta);
            for (int i = 0; i < gv_arti.Rows.Count; i++)
            {
                string talle = t.Rows[i]["c_talle"].ToString();
                string art = t.Rows[i]["c_articulo"].ToString();

                if (validarartxsuc(suc,art,talle)!=0)
                {

                    try
                    {
                        ((Label)gv_arti.Rows[i].FindControl("lb_contiene")).Text = "SI";
                    }
                    catch (Exception)
                    {

                        ((DropDownList)gv_arti.Rows[i].FindControl("dd_contiene")).SelectedValue = "SI";

                    }

                }
                else
                {
                    try
                    {
                        ((Label)gv_arti.Rows[i].FindControl("lb_contiene")).Text = "NO";
                    }
                    catch (Exception)
                    {

                        ((DropDownList)gv_arti.Rows[i].FindControl("dd_contiene")).SelectedValue = "NO";

                    }

                }
            }







        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            else {
                
                  
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.Session["sucursal"] = dd_sucursales.SelectedValue;
            cargargrid();
        }

        protected void gv_arti_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_arti.EditIndex = e.NewEditIndex;
            cargargrid();
        }

        protected void gv_arti_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string art = ((Label)gv_arti.Rows[e.RowIndex].FindControl("lb_codart")).Text;
            string talle = ((Label)gv_arti.Rows[e.RowIndex].FindControl("lb_codtall")).Text;
            string contiene = ((DropDownList)gv_arti.Rows[e.RowIndex].FindControl("dd_contiene")).SelectedValue;
            string suc = this.Session["sucursal"].ToString();

            if (contiene == "SI")
            {
                try
                {
                    aq.aplicarconsultasql("insert into articulosxsucursales select " + art + "," + suc + "," + talle + ",1,0");
                }
                catch (Exception)
                {
                    aq.aplicarconsultasql("update articulosxsucursales set baja = 0 where c_articulo = " + art + " and c_sucursal = " + suc + " and c_talle = " + talle+"");

                }
                this.Session["msj"] = "Se ha modificado correctamente!";
            }
            else {

                try
                {
                    aq.aplicarconsultasql("update articulosxsucursales set baja=1 where c_articulo=" + art + " and c_sucursal=" + suc + " and c_talle=" + talle);
                    this.Session["msj"] = "Se ha modificado correctamente!";

                }
                catch (Exception)
                {
                  //  this.Session["error"] = "No se ha podido modificar el articulo";


                }
            }
            gv_arti.EditIndex = -1;
            cargargrid();

        }

        protected void gv_arti_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            
            gv_arti.EditIndex = -1;
            cargargrid();
        }
    }
}