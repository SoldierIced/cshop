using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1.Administrador
{
    public partial class Usuarios_adm : System.Web.UI.Page
    {
        AccesoDatos aq = new AccesoDatos();
        
        void cargargrid() {

          GridView1.DataSource=  aq.ObtenerTabla("select c_usuario ,nombre,apellido,dni,email,tipouser,estado from usuarios");
            GridView1.DataBind();
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            cargargrid();

            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = aq.ObtenerTabla("select c_usuario ,nombre,apellido,dni,email,tipouser,estado from usuarios");
            GridView1.DataBind();
        }

        

        

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string IdUser = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1")).Text;
            string nombre = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_nombre")).Text;
            string apellido = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_apellido")).Text;
            string dni = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_DNI")).Text;
            string email = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_Mail")).Text;
            string tipouser = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_Tipo")).Text;
            string Estado = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("tb_estado")).Text;

            try
            {
                aq.aplicarconsultasql("update usuarios set estado = '" + Estado + "' ,nombre = '" + nombre 
                    + "' ,apellido = '" + apellido + "' ,dni = '" + dni + "' ,email = '" + email 
                    + "' ,tipouser = '" + tipouser + "' where C_usuario = " + IdUser);
                this.Session["msj"] = "Se ha modificado correctamente!";
                
            }
            catch (Exception)
            {
                this.Session["error"] = "No se ha podido modificar el Usuario";
            }

            GridView1.EditIndex = -1;
            GridView1.DataSource = aq.ObtenerTabla("select c_usuario ,nombre,apellido,dni,email,tipouser,estado from usuarios");
            GridView1.DataBind();
        }



        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = aq.ObtenerTabla("select c_usuario ,nombre,apellido,dni,email,tipouser,estado from usuarios");
            GridView1.DataBind();
        }
    }
}