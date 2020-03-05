using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1
{
    public partial class Alta_Sucursal : System.Web.UI.Page
    {
        clases.sucursal s = new clases.sucursal();
        public void cargartabla() {
            DataTable t = new DataTable();
            clases.sucursal.all(ref t);
            t.Rows.Add();
            
            GridView1.DataSource = t;
            GridView1.DataBind();
            
        }

        public int validaruser()
        {
            try
            {
                if (this.Session["user"] != null)
                {
                    Usuario u = new Usuario();
                    u = (Usuario)this.Session["user"];
                    if (Usuario.validaradmin(u.get_tiposuario()) == 1)
                    {
                        return 1;
                    }
                    else { return -1; }
                }
                else { return -1; }
            }
            catch (Exception)
            {

                return -1;
            }
            return -1;


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (validaruser() == 1)
            {
                cargartabla();
                if (Session["error"] != null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + Session["error"] + "')", true);
                    Session["error"] = null;
                }
            }
            else { Server.Transfer(gl.principal_us); }
            

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            cargartabla();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            cargartabla();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //actualizar la wea
            string nombre = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            string direccion = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;
            string codigo = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2")).Text;
            clases.sucursal s = new clases.sucursal(nombre, direccion, codigo);
            if (s.update() != 1)
            {
                this.Session["error"] = "No se ha actualizado correctamente la sucursal";
            }
            else { this.Session["error"] = "Cambio hecho correctamente."; }


        }
    }
}