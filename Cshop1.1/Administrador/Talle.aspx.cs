using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1.Administrador
{
    public partial class Talle : System.Web.UI.Page
    {

        AccesoDatos aq = new AccesoDatos();
        public void cargartabla()
        {

            DataTable t = new DataTable();
            t = aq.ObtenerTabla("select * from talles");
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
          
            string talle = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            string codigo = ((Label)GridView1.Rows[e.RowIndex].FindControl("l_talle2")).Text;
            clases.Talles col = new clases.Talles(talle, codigo); 
            if (talle != string.Empty)
            {
                if (col.update() == 1)
                {
                    Session["msj"] = "Talle actualizado correctamente.";
                }
                else
                {
                    Session["error"] = "Error al actualizar el talle.";
                }
            }
            else
            {
                Session["error"] = "No se permite campo vacio en el talle.";
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
            //nuevo color
            if (t_talle.Text != string.Empty)
            {
                clases.Talles col = new clases.Talles(t_talle.Text);

                if (col.insert_into() == 1)
                {
                    Session["msj"] = "Sucursal creada correctamente.";
                }
                else
                {
                    Session["error"] = "Error a dar de alta a la sucursal.";

                }

                Response.Redirect("Talle.aspx");
            }
            else
            {
                Session["error"] = "Error no se permite talles vacios.";
            }
        }
    }
    
}