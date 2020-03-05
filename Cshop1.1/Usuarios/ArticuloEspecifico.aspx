<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="ArticuloEspecifico.aspx.cs" Inherits="Cshop1._1.Formulario_web12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
      


      <!-- fonts -->
      <link href="//fonts.googleapis.com/css?family=Nunito:300,400,700" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Muli:300,400" rel="stylesheet">
      <!-- /fonts -->
      <!-- css -->
      <link href="css/Estilos.css" rel='stylesheet' type='text/css' media="all" />
      <!-- /css -->
        <%
                if (this.Session["msj"] != null)
                {    %>
    <% String var = this.Session["msj"].ToString(); %>
        <div class="alert alert-success" style="width: 40%;" role="alert">
            <%=var%>
        </div>
        <%this.Session["msj"] = null;
            }
            else
            {
                if (this.Session["error"] != null)
                {
                    String var = this.Session["error"].ToString(); %>
                <div class="alert alert-danger" style="width: 40%;" role="alert">
                    <%=var%>
                </div>
        <%
                }
            }
        %>

    <section class="product-overview" style="margin:50px 0;">

        <div class="container">


            <div class="product row">

                <div class="images col-sm-12 col-md-6">
                    <div class="big-image thumbnail">
                        <asp:Image ID="imagen" runat="server" Style="width: 450px; height: 500px" />
                    </div>

                </div>
                <div class="info col-sm-12 col-md-6">
                    <h3><asp:Label ID="titulo" runat="server" Text="Label"></asp:Label></h3>
                    
                    <asp:Label ID="Desc" runat="server" Text="Label" class="ff-futuralight" Style="display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;"></asp:Label>
                    
                    <div class="row prices">

                      
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <label for="fd_amount">Talle:</label><br>

                                    <asp:DropDownList ID="dd_talle" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="dd_talle_SelectedIndexChanged"></asp:DropDownList>
                                    
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <label for="fd_amount">Colores:</label>
                                    <asp:Image ID="img_color" runat="server" Width="20px" Height="20px" />
                                    <br>

                                    <asp:DropDownList ID="dd_colores" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="dd_colores_SelectedIndexChanged"></asp:DropDownList>

                                   
                                </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="width:100%;">
                                    <ContentTemplate>
                                <div class="col-xs-4 col-sm-4 col-md-4" style="margin-top: 10px;">
                                    
                                    <label for="fd_amount">Cantidad:</label><br>

                                    <asp:DropDownList ID="dd_cantidades" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="dd_cantidades_SelectedIndexChanged"></asp:DropDownList>

                                </div>
                         
                                <div class="col-xs-8 col-sm-8 col-md-8 text-center" style="margin-top: 10px;">
                                    
                                         <div class="alert alert-success" role="alert" style="margin-top: 20px;">
                                            Precio Unitario.     <b>$</b>
                                            <asp:Label ID="Precio" runat="server" Text="Label" class="fw-700" Style="font-weight: bold;"></asp:Label>
                                           <br />

                                            <asp:Label ID="lb_precioTotalText" runat="server" Text="Label" class="fw-700" Style="font-weight: bold;" Visible="False"></asp:Label>

                                            <asp:Label ID="lb_preciototal" runat="server" Text="Label" class="fw-700" Style="font-weight: bold;" Visible="False"></asp:Label>
                                         </div>
                                    
                                    <!-- <label for="">Precio Unitario.     $ </label>-->

                                </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                                    <asp:Button ID="Carro" class="btn btn-success" runat="server" Text="Agregar al Carrito" OnClick="Carro_Click" />
                                </div>
                           

                    </div>

                    <hr>
                </div>
            </div>
        </div>
</section>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

      <script  src="https://code.jquery.com/jquery-3.3.1.min.js"  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
      
</asp:Content>
