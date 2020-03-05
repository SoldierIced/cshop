using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1
{
    public partial class TiposRopa : System.Web.UI.Page
    {
        AccesoDatos aq = new AccesoDatos();
        public void cargartabla()
        {

            DataTable t = new DataTable();
            t = aq.ObtenerTabla("select * from tiporopa");
            GridView1.DataSource = t;
            GridView1.DataBind();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargartabla();

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            cargartabla();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //actualizar color
            string detalle = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;
           
            string codigo = ((Label)GridView1.Rows[e.RowIndex].FindControl("l_tiporopa2")).Text;
            clases.Tiporopa col = new clases.Tiporopa(detalle,codigo);
            if (detalle != string.Empty)
            {
                if (col.update() == 1)
                {
                    Session["msj"] = "Tipo de ropa actualizada correctamente.";
                }
                else
                {
                    Session["error"] = "Error al actualizar el tipo de ropa.";
                }
            }
            else
            {
                Session["error"] = "No se permite campo vacio en el detalle.";
            }
            GridView1.EditIndex = -1;
            cargartabla();
            

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            cargartabla();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            //nuevo tiporopa
            if (t_detalle.Text != string.Empty)
            {
                clases.Tiporopa col = new clases.Tiporopa(t_detalle.Text);

                if (col.insert_into() == 1)
                {
                    Session["msj"] = "Tipo de ropa creada correctamente.";
                }
                else
                {
                    Session["error"] = "Error a dar de alta a tipo de ropa.";

                }

                Response.Redirect("TiposRopa.aspx");
            }
            else
            {
                Session["error"] = "El detalle no puede estar vacio.";
            }
        }
    }
}