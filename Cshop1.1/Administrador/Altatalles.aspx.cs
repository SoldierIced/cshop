using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1.Administrador
{
    public partial class Altatalles : System.Web.UI.Page
    {
        AccesoDatos aq = new AccesoDatos();
        string[] selec ;
        void cargargrid() {

            gv_talles.DataSource = aq.ObtenerTabla("select * from talles");
            gv_talles.DataBind();
            DataTable t = aq.ObtenerTabla("select * from talles");
            for (int i = 0; i < gv_talles.Rows.Count; i++)
            {
                string talle = t.Rows[i][0].ToString();
                if (clases.Productos.consultar_talle(talle, selec[0]) != -1)
                {

                    try
                    {
                        ((Label)gv_talles.Rows[i].FindControl("lb_contiene")).Text = "SI";
                    }
                    catch (Exception)
                    {

                        ((DropDownList)gv_talles.Rows[i].FindControl("dd_contiene")).SelectedValue = "SI";

                    }

                }
                else {
                    try
                    {
                        ((Label)gv_talles.Rows[i].FindControl("lb_contiene")).Text = "NO";
                    }
                    catch (Exception)
                    {

                        ((DropDownList)gv_talles.Rows[i].FindControl("dd_contiene")).SelectedValue = "NO";

                    }

                }
            }

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            selec = (string[])this.Session["select"];
            if (!IsPostBack)
            {
                cargargrid();

            }


        }

        protected void gv_talles_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_talles.EditIndex = e.NewEditIndex;
            cargargrid();
        }

        protected void gv_talles_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            AccesoDatos aq =new AccesoDatos();
            string contiene = ((DropDownList)gv_talles.Rows[e.RowIndex].FindControl("dd_contiene")).SelectedValue;
            string codigo = ((Label)gv_talles.Rows[e.RowIndex].FindControl("lb_tallecodigo")).Text;
            try
            {
                if (contiene == "SI")
                {
                    try
                    {
                        aq.aplicarconsultasql("insert into tallesxarticulo select " + codigo + "," + selec[0]);

                    }
                    catch (Exception)
                    {

                        
                    }
                  
                }
                else
                {
                    aq.aplicarconsultasql("delete tallesxarticulo where c_talle= " + codigo + " and c_articulo=" + selec[0]);
                }

                this.Session["msj"] = "Se ha modificado correctamente!";
            }
            catch (Exception)
            {
                this.Session["error"] = "No se ha podido modificar el talle";

            }

            gv_talles.EditIndex = -1;
            cargargrid();

        }

        protected void gv_talles_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_talles.EditIndex = -1;
            cargargrid();
        }
    }
}