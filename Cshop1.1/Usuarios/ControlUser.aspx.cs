using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Threading;

namespace Cshop1._1.Usuarios
{
    public partial class ControlUser : System.Web.UI.Page
    {

        public bool edit = false;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        void cargarTxt() {
            AccesoDatos aq = new AccesoDatos();
            Usuario user = (Usuario)this.Session["user"];
            idUser.Text = user.get_codigo().ToString();
            DataTable temp = new DataTable();
            temp = aq.ObtenerTabla("select estado, tipousuarios.detalle, usuarios.nombre, usuarios.apellido,usuarios.dni, usuarios.email, usuarios.contraseña from usuarios " +
                "inner join tipousuarios on usuarios.tipouser = tipousuarios.tipouser where usuarios.C_usuario = " + int.Parse(idUser.Text));
            txt_nombre.Text = temp.Rows[0][2].ToString();
            txt_apellido.Text = temp.Rows[0][3].ToString();
            txt_dni.Text = temp.Rows[0][4].ToString();
            txt_mail.Text = temp.Rows[0][5].ToString();
            txt_pass.Text = temp.Rows[0][6].ToString();
            txt_tipo.Text = temp.Rows[0][1].ToString();
            txt_estado.Text = temp.Rows[0][0].ToString();

        }

        //Mostrar Datos
        protected void Button1_Click(object sender, EventArgs e)
        {
            edit = true;
            cargarTxt();
        }
        //Boton cancelar
        protected void Button3_Click(object sender, EventArgs e)
        {
            edit = false;
        }
        //boton guardar
        protected void Button2_Click(object sender, EventArgs e)
        {
            AccesoDatos aq = new AccesoDatos();
            string ID = idUser.Text;
            string nombre = txt_nombre.Text;
            string apellido = txt_apellido.Text;
            string dni = txt_dni.Text;
            string email = txt_mail.Text;
            string tipouser;
            if (txt_tipo.Text == "ADMINISTRADOR") tipouser = "0";
            else { tipouser = "1"; }


            string Estado = txt_estado.Text;
            string pass = txt_pass.Text;


            try
            {
            
                aq.aplicarconsultasql("update usuarios set estado = '" + Estado + "',nombre = '" + nombre + "',apellido = '" + apellido + "',dni = '" + dni + "',email = '" + email + "',tipouser = " + tipouser + ",contraseña = '" + pass + "' where C_usuario = " + ID);
                
                this.Session["msj"] = "Se ha modificado correctamente!";

            }
            catch (Exception)
            {                                
                this.Session["error"] = "No se ha podido modificar el Usuario";
            }


            Thread.Sleep(2000);
            edit = false;
            
        }

        
    }
}