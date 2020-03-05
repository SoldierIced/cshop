using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1.Administrador
{
    public partial class Productos : System.Web.UI.Page
    {

        
        void cargartabla(string consulta= "select c_articulo,Articulos.c_tiporopa, tipoRopa.detalle, Articulos.DETALLEar, Articulos.precio, Articulos.url from articulos inner join tipoRopa on tipoRopa.c_tiporopa= Articulos.c_tiporopa") {
            AccesoDatos aq = new AccesoDatos();

            GridView1.DataSource = aq.ObtenerTabla(consulta);
            GridView1.DataBind();
          
            


        }
        void cargardrop() {

            AccesoDatos aq = new AccesoDatos();
            DropDownList2.DataSource = aq.ObtenerTabla("select * from tiporopa");

            DropDownList2.DataTextField = "detalle";// es el nombre del header del campo de donde se van a cargar los valores 	
            DropDownList2.DataValueField = "c_tiporopa";// numero de categoria en selectedvalue -.-
            DropDownList2.DataBind();

        }

        void cargartablacolores()
        {
            string[] selec = (string[])this.Session["select"];

            AccesoDatos aq = new AccesoDatos();
            gv_colores.DataSource = aq.ObtenerTabla("select c.c_color,nombre,url from colores as c");
            gv_colores.DataBind();

            for (int i = 0; i < gv_colores.Rows.Count; i++)
            {
                string text = "";
                try
                {
                  text = ((Label)gv_colores.Rows[i].FindControl("Label10")).Text;
                }
                catch (Exception)
                {

                    text = ((Label)gv_colores.Rows[i].FindControl("Label11")).Text;
                }
               
                if (clases.Colores.verificarcolor(selec[0], text) == 1)
                {
                    try
                    {
                        ((Label)gv_colores.Rows[i].FindControl("lb_pertenece")).Text = "SI";
                    }
                    catch (Exception)
                    {

                        ((DropDownList)gv_colores.Rows[i].FindControl("DropDownList3")).SelectedValue = "SI";

                    }
                    


                }
                else
                {
                    try
                    {
                        ((Label)gv_colores.Rows[i].FindControl("lb_pertenece")).Text = "NO";
                    }
                    catch (Exception)
                    {

                        ((DropDownList)gv_colores.Rows[i].FindControl("DropDownList3")).SelectedValue = "NO";

                    }

                   

                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                cargartabla();
                cargardrop();
            }
            if (this.Session["select"] != null) {


                cargartablacolores();
              


            }

        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            cargartabla();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            //actualizar la wea

            string tipo = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1")).SelectedValue;
            string detalle = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            string precio = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;
            string codigo = ((Label)GridView1.Rows[e.RowIndex].FindControl("l_articulo2")).Text;
            //string url = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("tb_url")).Text;

            string url = ((FileUpload)GridView1.Rows[e.RowIndex].FindControl("fu_url2")).FileName;
            if (((FileUpload)GridView1.Rows[e.RowIndex].FindControl("fu_url2")).HasFile)
                ((FileUpload)GridView1.Rows[e.RowIndex].FindControl("fu_url2")).SaveAs(Server.MapPath("/images/" + url));
            url = "/images/" + url;


            float p = 0;
            try
            {
                p = float.Parse(precio);
                precio = precio.Replace(",", ".");
            }
            catch (Exception)
            {

                Session["error"] = "Recuerde que en precio van solo numeros, enteros o con coma";
            }

            if (p != 0)
            {
                clases.Productos s = new clases.Productos(tipo, detalle, precio, url, codigo);
                if (s.update() != 1)
                {
                    this.Session["error"] = "No se ha actualizado correctamente la sucursal";
                }
                else
                {
                    this.Session["msj"] = "Cambio hecho correctamente.";
                    GridView1.EditIndex = -1;
                    cargartabla();
                }

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            cargartabla();
        }

        protected void DropDownList2_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            string url = fu_url.FileName;
            if (fu_url.HasFile)
                fu_url.SaveAs(Server.MapPath("/images/" + url));
            url = "/images/" + url;




            clases.Productos p = new clases.Productos(DropDownList2.SelectedValue, detalleproducto.Text, precioproducto.Text,nombreproducto.Text, url,"");
            float pre = 0;


            if (detalleproducto.Text!=string.Empty && precioproducto.Text!=string.Empty && DropDownList2.SelectedValue!="")
            {
                try
                {
                    pre = float.Parse(precioproducto.Text);
                    precioproducto.Text = precioproducto.Text.Replace(",", ".");
                }
                catch (Exception)
                {
                    Session["error"] = "Recuerde que en precio van solo numeros, enteros o con coma";
                }
                if (pre != 0)
                {

                    if (p.insert_into() == 1)
                    {
                        Session["msj"] = "Articulo dado de alta exitosamente";
                        Response.Redirect("Productos.aspx");
                    }
                    else
                    {
                        Session["error"] = "No se ha podido dar de alta al articulo";
                    }
                }
                else
                {
                    Session["error"] = "Recuerde que el precio debe ser un numero y puede tener , o .";
                }
            }
            else
            {
                Session["error"] = "No se permiten campos vacios.";
            }

           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

          
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string codigo = ((Label)GridView1.Rows[e.NewSelectedIndex].FindControl("l_codigo")).Text;
            string detalle = ((Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label7")).Text;
            string[] s = { codigo, detalle };
            this.Session["select"] = s;
        }

        protected void gv_colores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_colores.EditIndex = e.NewEditIndex;
           cargartablacolores();
        }

        protected void gv_colores_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string[] selec = (string[])this.Session["select"];
            //actualizar la wea
            string codigo = ((Label)gv_colores.Rows[e.RowIndex].FindControl("Label11")).Text;
            string value= ((DropDownList)gv_colores.Rows[e.RowIndex].FindControl("DropDownList3")).SelectedItem.Text;
            string consulta = "";
            if (value == "NO")
            {

                consulta = "insert into coloresxarticulos select '" + codigo + "', '" + selec[0] + "'";
            }
            else {
                consulta = "delete coloresxarticulos where c_color= '" + codigo + "' and c_articulo= '" + selec[0] + "'";


            }
            AccesoDatos aq = new AccesoDatos();
            aq.aplicarconsultasql(consulta);


            gv_colores.EditIndex = -1;
            cargartablacolores();

        }

        protected void gv_colores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_colores.EditIndex = -1;
            cargartablacolores();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Altatalles.aspx");

        }
    }
}