using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cshop1._1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["error"] != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + Session["error"] + "')", true);
                Session["error"] = null;
            }
        }

        protected void Logear_Click(object sender, EventArgs e)
        {

            

            Usuario u = new Usuario(email.Text, contrase.Text);
            if (u.verificarexiste() != -1)
            {
                u.obtenerdatos();
                Session["user"] = u;

                if (CheckBox1.Checked)
                {
                    Response.Cookies["email"].Value = u.get_email();
                    Response.Cookies["contraseñausuario"].Value = u.get_contraseña();
                    Response.Cookies["contraseñausuario"].Expires = DateTime.Today.AddDays(40);
                    Response.Cookies["email"].Expires = DateTime.Today.AddDays(40);

                }
                Response.Redirect(gl.principal_us);
            }
            else {
                Session["error"] = null;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + "Datos no encontrados" + "')", true);
            }



        }
    }
}