using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1.Administrador
{
    public partial class Colores : System.Web.UI.Page
    {
        AccesoDatos aq = new AccesoDatos();
        public void cargartabla()
        {   

            DataTable t = new DataTable();
            t = aq.ObtenerTabla("select * from colores");
            GridView1.DataSource = t;
            GridView1.DataBind();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                cargartabla();

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            cargartabla();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
           
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //actualizar color
            string nombre = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;
            string url = ((FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1")).FileName;
            if (((FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1")).HasFile)
                ((FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1")).SaveAs(Server.MapPath("/images/" + url));
            url = "/images/" + url;
            string codigo = ((Label)GridView1.Rows[e.RowIndex].FindControl("l_color2")).Text;
            clases.Colores col = new clases.Colores(nombre, url,codigo);
            if (nombre!=string.Empty)
            {
                if (col.update() == 1)
                {
                    Session["msj"] = "Sucursal actualizada correctamente.";
                }
                else
                {
                    Session["error"] = "Error al actualizar la sucursal.";
                }
            }
            else
            {
                Session["error"] = "No se permite campo vacio en el nombre.";
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
            if (t_nombre.Text != string.Empty && t_urlcolor.FileName != string.Empty)
            {
                string url = t_urlcolor.FileName;
                if (t_urlcolor.HasFile)
                    t_urlcolor.SaveAs(Server.MapPath("/images/" + url));
                url = "/images/" + url;

                clases.Colores col = new clases.Colores(t_nombre.Text, url);

                if (col.insert_into() == 1)
                {
                    Session["msj"] = "Sucursal creada correctamente.";
                }
                else
                {
                    Session["error"] = "Error a dar de alta a la sucursal.";

                }

                Response.Redirect("Colores.aspx");
            }
            else {
                    Session["error"] = "Error a dar de alta a la sucursal.";
            }
        }
    }
}