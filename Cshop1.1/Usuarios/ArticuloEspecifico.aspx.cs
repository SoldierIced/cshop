using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cshop1._1
{
    public partial class Formulario_web12 : System.Web.UI.Page
    {
        string valor = "";

        

        protected void Page_Load(object sender, EventArgs e)
        {

           valor = Convert.ToString(Request.QueryString["cod"]);

            if (!IsPostBack) {
               
                cargarcampos();
                cargartalles();
                cargarcantidades();
                cargarcolores();
                cargarPrecioTotal();
            }
        }
        /// <summary>
        /// Carga de  titulo, descripcion, imagen , precio en la vista
        /// </summary>
        void cargarcampos() {
            string idArti = valor;

            
            DataTable temporal = clases.Productos.datos(idArti);
            

            try
            {
                titulo.Text = temporal.Rows[0]["nombreArt"].ToString();
                Desc.Text = temporal.Rows[0]["detallear"].ToString();
                imagen.ImageUrl = temporal.Rows[0]["url"].ToString();
                float pre = float.Parse(temporal.Rows[0]["precio"].ToString());
                Precio.Text = pre.ToString();

            }
            catch (Exception)
            {
                
            }
            temporal = null;
          
           

        }

        
        /// <summary>
        /// carga de dd_talles de la vista
        /// </summary>
        void cargartalles()
        {
            try
            {
                dd_talle.DataSource = clases.Productos.get_talles(valor);
                dd_talle.DataTextField = "detalle";
                dd_talle.DataValueField = "c_talle";
                dd_talle.DataBind();
            }
            catch (Exception ex)
            {
                // con esta manera mostramos el mensaje de error , solo para debug 
                this.Session["error"] = ex.ToString();
            }
        }

        /// <summary>
        /// carga de  los colores en la vista
        /// </summary>
        void cargarcolores() {
            try
            {
                dd_colores.DataSource = clases.Productos.get_colores(valor);
                dd_colores.DataTextField = "Color";
                dd_colores.DataValueField = "c_color";
                dd_colores.DataBind();

                DataTable imagen = clases.Productos.get_colores(valor);
                img_color.ImageUrl = imagen.Rows[0]["imagen"].ToString();
                img_color.DataBind();
            }
            catch (Exception ex)
            {
                // con esta manera mostramos el mensaje de error , solo para debug 
                this.Session["error"] = ex.ToString();
            }

        }


        void cargarcantidades() {
            string stock = clases.Productos.stock_articulo_xtalle(valor, dd_talle.SelectedValue);
            if (stock == "") { stock = "0"; }
            dd_cantidades.Items.Clear();
            for (int i = 0; i < int.Parse(stock); i++)
            {
                dd_cantidades.Items.Add((i + 1).ToString());
            }
        }


        protected void dd_talle_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarcantidades();
        }

        protected void dd_cantidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            float total = float.Parse(dd_cantidades.SelectedItem.Text) * float.Parse(Precio.Text);

            lb_precioTotalText.Text = "Precio total: $";
            lb_preciototal.Text = total.ToString();
            lb_precioTotalText.Visible = true;
            lb_preciototal.Visible = true;
        } 

        void cargarPrecioTotal()
        {
            try
            {
                float total = float.Parse(dd_cantidades.SelectedItem.Text) * float.Parse(Precio.Text);
                lb_preciototal.Text = total.ToString();
            }
            catch (Exception)
            {
                lb_preciototal.Text= "";
            }
           
            lb_precioTotalText.Text = "Precio total: $";
         
            lb_precioTotalText.Visible = true;
            lb_preciototal.Visible = true;
        }

        protected void dd_colores_SelectedIndexChanged(object sender, EventArgs e)
        {
            AccesoDatos aq = new AccesoDatos();
            string consulta = "select colores.url from colores where colores.nombre = '" + dd_colores.SelectedItem.ToString() + "'";
            DataTable imagen = aq.ObtenerTabla(consulta);
            img_color.ImageUrl = imagen.Rows[0]["url"].ToString();
            img_color.DataBind();
        }






        protected void botonCarrito_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario u = (Usuario)this.Session["user"];
                string cant = dd_cantidades.SelectedItem.ToString();
                string color = dd_colores.SelectedValue.ToString();
                string talle = dd_talle.SelectedValue.ToString();
                string codigo = u.get_codigo().ToString();
                clases.carrito.insert(codigo, valor, talle, color, cant);
                this.Session["msj"] = "Se ha agregado el articulo al carrito";
            }
            catch (Exception)
            {
                this.Session["error"] = "no se pudo  agregar al carrito";
              
            }
          
            //if (Session["carrito"] == null)
            //{
            //    Session["carrito"] = crearTabla();
            //}
            //AgregarFila((DataTable)Session["carrito"], titulo.Text, Desc.Text, lb_preciototal.Text);
        }

        public DataTable crearTabla()
        {
            //creo una tabla 
            DataTable dt = new DataTable();

            //Los nombres deben coincidir con los de la BD

            //Creo y agrego las columnas a la tabla 
            DataColumn columna = new DataColumn("Articulo", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Detalle", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("precio", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Color", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Talle", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Cantidad", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            return dt;
        }

        public void AgregarFila(DataTable tabla, string nombre, string descripcion, string precio)
        {

            //Creo una nueva fila
            DataRow dr = tabla.NewRow();

            //Cargo datos a la fila (recordar nombre ej:"Id_Horario" tiene que estar igual que en la BD)
            dr["Articulo"] = nombre;
            dr["Detalle"] = descripcion;
            dr["precio"] = precio;
            dr["Color"] = dd_colores.SelectedItem.ToString();
            dr["Talle"] = dd_talle.SelectedItem.ToString();
            dr["Cantidad"] = dd_cantidades.SelectedItem.ToString();


            //Asigno la fila a la tabla que recibo por parametro
            tabla.Rows.Add(dr);
        }

        protected void Carro_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario u = (Usuario)this.Session["user"];
                string cant = dd_cantidades.SelectedItem.ToString();
                string color = dd_colores.SelectedValue.ToString();
                string talle = dd_talle.SelectedValue.ToString();
                string codigo = u.get_codigo().ToString();
                clases.carrito.insert(codigo, valor, talle, color, cant);
                this.Session["msj"] = "Se ha agregado el articulo al carrito";
            }
            catch (Exception ex)
            {
                this.Session["error"] = "no se pudo  agregar al carrito";

            }

            //if (Session["carrito"] == null)
            //{
            //    Session["carrito"] = crearTabla();
            //}
            //AgregarFila((DataTable)Session["carrito"], titulo.Text, Desc.Text, lb_preciototal.Text);
        }
    }
}