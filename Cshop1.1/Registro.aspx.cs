using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cshop1._1
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["error"] != null) {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + Session["error"] + "')", true);
                Session["error"] = null;
            }
            if (Session["user"] != null) {
                Server.Transfer(gl.principal_us);
            }
            


           
        }

     

        protected void Logear_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true) { 
            Usuario u = new Usuario(email.Text,contraseña.Text,nombre.Text,apellido.Text,dni.Text,1);
            if (u.verificarexiste() == -1)
            {
                if (u.registrar() != 1)
                {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + "no se ha podido registrar." + "')", true);
                    Session["error"] =null;
                }
                    else
                {
                    Session["user"] = u;
                Server.Transfer(gl.principal_us);
                }
            }

            else {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + "Ese email ya pertenece a una cuenta." + "')", true);
                    Session["error"] =null;
                    Server.Transfer(gl.login);
                }

            }
        }
    }
}