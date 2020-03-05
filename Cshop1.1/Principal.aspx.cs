using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1
{
    public partial class Principal : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (this.Session["user"] == null)
            {
                if (Request.Cookies["email"] != null && Request.Cookies["contraseñausuario"] != null)
                {
                    string mail = Request.Cookies["email"].Value;
                    string contraseña = Request.Cookies["contraseñausuario"].Value;
                    Usuario u = new Usuario(mail, contraseña);
                    if (u.obtenerdatos() == 1)
                    {
                        this.Session["user"] = u;
                    }

                }
            }

        }

      
    }
}