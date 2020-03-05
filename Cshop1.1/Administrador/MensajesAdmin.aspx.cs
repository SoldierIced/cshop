using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cshop1._1.Administrador
{
    public partial class MensajesAdmin : System.Web.UI.Page
    {
        void cargartabla() {

           GridView1.DataSource= AccesoDatos.ObtenerTabla2("select * from MensajeContacto");
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            cargartabla();
        }
    }
}