using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cshop1._1
{
    public partial class Maestra : System.Web.UI.MasterPage
    {
        Usuario u = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null) {
                inisesion.Text = "Cerrar sesion.";
                 u =(Usuario) Session["user"];
                Label1.Text="Bievenid@: "+u.get_nombre()+", " + u.get_apellido();
                regiss.Visible = false;
                
                Button2.Visible = true;
                if (u.get_tiposuario() == 0) {
                    administrador.Visible = true;
                }
            }

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (u.get_nombre() == null)
            {
                Response.Redirect(gl.login);
                
            }
            else {
                Session["user"] = null;

                Response.Redirect(gl.principal_us);
            }
        }

        protected void Registrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect(gl.registro);
        }

        protected void inisesion_Click(object sender, EventArgs e)
        {
            if (inisesion.Text == "Cerrar sesion.")
            {

                Session["user"] = null;
                Label1.Visible = false;
                inisesion.Text = "Iniciar Sesion.";
                regiss.Visible = true;

                Response.Redirect(gl.principal_us);
            }
            else {
                Response.Redirect(gl.login);
            }
        }

        protected void administrador_Click(object sender, EventArgs e)
        {
            Response.Redirect(gl.principal_adm);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

           Response.Redirect(gl.contacto);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(gl.ControlUser);
        }
    }
}