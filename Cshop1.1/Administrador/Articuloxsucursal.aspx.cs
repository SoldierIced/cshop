using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cshop1._1.Administrador
{
    public partial class Articuloxsucursal : System.Web.UI.Page
    {
        AccesoDatos aq = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 


            try
            {
                cargargrid();
            }
            catch (Exception)
            {
                
            }
            }


        }

        void cargargrid() {
            string consulta = "select a.nombreArt,a.c_articulo,detalle,stock,art.c_talle from articulosxsucursales as art inner join talles on art.c_talle= talles.c_talle inner join Articulos as a on art.c_articulo=a.c_articulo order by a.nombreArt,detalle";
           gv_artxsuc.DataSource= aq.ObtenerTabla(consulta);
            gv_artxsuc.DataBind();

        }

        protected void btn_cancelarsuc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Principal.aspx");
        }

        protected void btn_aceptarsuc_Click(object sender, EventArgs e)
        {


            this.Session["sucursal"] = dd_sucursales.SelectedValue;

        }

        protected void gv_artxsuc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_artxsuc.EditIndex = e.NewEditIndex;
            cargargrid();
        }

        protected void gv_artxsuc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            //codigo de actualizar
            int col = e.RowIndex;
            // string codigo = ((Label)gv_artxsuc.Rows[e.RowIndex].FindControl("Label11")).Text;
            string stock = ((TextBox)gv_artxsuc.Rows[col].FindControl("tb_stock")).Text;
            string articulo = ((Label)gv_artxsuc.Rows[col].FindControl("lb_codigo")).Text;
            string sucursal = this.Session["sucursal"].ToString();
            string talle = ((Label)gv_artxsuc.Rows[col].FindControl("lb_ctalle")).Text;
            int a = 0;
            try
            {
                stock = int.Parse(stock).ToString();
                a = 1;
            }
            catch (Exception)
            {
                Session["error"] = "Articulo no modificado, ya que el stock deben ser numeros enteros.";
                gv_artxsuc.EditIndex = -1;
                cargargrid();
                a = 0;
            }

            if (a == 1)
            {

                try
                {
                    aq.aplicarconsultasql("update articulosxsucursales set stock=" + stock + " where c_articulo=" + articulo + " and c_sucursal =" + sucursal + " and c_talle=" + talle + " ");

                    this.Session["msj"] = "Stock actualizado correctamente!";
                }
                catch (Exception ex)
                {
                    this.Session["error"] = ex.ToString();

                }

            }

            gv_artxsuc.EditIndex = -1;
            cargargrid();
        }

        protected void gv_artxsuc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_artxsuc.EditIndex = -1;
            cargargrid();
        }

        protected void gv_artxsuc_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }
    }
}