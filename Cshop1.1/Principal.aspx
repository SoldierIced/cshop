<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="Cshop1._1.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>

        #imagenMostrada:hover{
        -webkit-transform: translateY(0px) scale(0.8);
        -moz-transform: translateY(0px) scale(0.8);
        -ms-transform: translateY(0px)  scale(0.8);
        -o-transform: translateY(0px) scale(0.8);
        transform: translateY(0px) scale(0.8);
        }
        #imagenMostrada{
        -webkit-transition: all 0.35s ease-in-out;
        -moz-transition: all 0.35s ease-in-out;
        transition: all 0.35s ease-in-out;
        }


    </style>
   
    <main class="site-main" style="padding-top: 0px;">
        
        
        <!--Contenedor de los productos-->
         <div id="shopify-section-static-collection" class="shopify-section collection--section" style="width:80%; margin-left:10%;">
            <div class="productgrid--outer     layout--has-sidebar  ">

                <div class="productgrid--items">
                            
<% 

    AccesoDatos aq = new AccesoDatos();
    System.Data.DataTable t  = new System.Data.DataTable();
    int opcionListado = 0;

    try
    {
        if (Request.QueryString["key"].ToString() != "")
        {
            string valor = Request.QueryString["key"].ToString();
            opcionListado = int.Parse(valor);
        }

    }
    catch
    {
        opcionListado = -1;
    }




    switch (opcionListado)
    {
        case 1:
            t =  aq.ObtenerTabla("select c_articulo,detallear,precio,url from Articulos where c_tiporopa = 1 order by c_articulo desc  ");
            break;
        case 2:
            t =  aq.ObtenerTabla("select c_articulo,detallear,precio,url from Articulos where c_tiporopa = 2 order by c_articulo desc  ");
            break;
        default:
            t =  aq.ObtenerTabla("select c_articulo,detallear,precio,url from Articulos order by c_articulo desc");
            break;
    }

    int i = 0;

    for ( i = 0;  i <t.Rows.Count; i++)
    {
        System.Data.DataTable talles= aq.ObtenerTabla("select * from tallesxarticulo where c_articulo='" + t.Rows[i]["c_articulo"].ToString() + "'");

        if (talles.Rows.Count != 0) {

            System.Data.DataTable colores= aq.ObtenerTabla("select * from ColoresxArticulos where c_articulo='" + t.Rows[i]["c_articulo"].ToString() + "'");

            if (colores.Rows.Count != 0) {

    %>
       
            <article class="productgrid--item  imagestyle--cropped-small productitem--sale  productitem--emphasis  gp-featured-collection "
                data-product-item="" tabindex="1" >

              <div class="productitem" data-product-item-content="">

                 <%string val = "<a class=\"productitem--image-link\" href=\""+ @"Usuarios\ArticuloEspecifico.aspx"+"?cod=" + t.Rows[i]["c_articulo"].ToString() + "\">"; %>
                 <%=val%>
    
                  <figure class="productitem--image" data-product-item-image="">
             
                      <img id="imagenMostrada" src="<% Response.Write("."+t.Rows[i]["url"].ToString());%>"
                          alt="Imagen No Existe"
                          data-rimg="loaded" data-rimg-scale="1" 
                          srcset="<% Response.Write("."+t.Rows[i]["url"].ToString());%>"
                          data-rimg-template-svg="data:image/svg+xml;utf8,&lt;svg%20xmlns=&#39;">
      
                  </figure>
               
                  <div class="productitem--info">

    
            <span class="productitem--badge badge--sale gp-product-badge" data-badge-sales="">
    
                  Sale
    
              </span>
                  <h2 class="productitem--title">
                    <a href="#">
                        <%  Response.Write(t.Rows[i]["detallear"].ToString());  %>
                    </a>
                  </h2>
        
            <div class="productitem--price ">
  

              <div class="price--main" data-price="">  
                        <span class="money"> $ <% float precioDec = float.Parse(t.Rows[i]["precio"].ToString());
                          Response.Write(precioDec);  %>
                  </span>
                  
              </div>
            </div>
      </div>
    </div>
            </article>
    
    <% //Cierre llave del for 
          }
        }
    } %>
       
                </div>
         </div>
         </div>















          </main>

</asp:Content>
