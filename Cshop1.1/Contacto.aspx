<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="Cshop1._1.Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
     <!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Contacto</title>

      <script  src="https://code.jquery.com/jquery-3.3.1.min.js"  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>



      <!-- fonts -->
      <link href="//fonts.googleapis.com/css?family=Nunito:300,400,700" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Muli:300,400" rel="stylesheet">
      <!-- /fonts -->
      <!-- css -->
      <link href="css/Estilos.css" rel='stylesheet' type='text/css' media="all" />
      <!-- /css -->
  </head>
  <body>
      <style>
          input[type=text]{
              color:white !important;
          }
          #ContentPlaceHolder1_Btn_Enviar{
              color:white !important;
          }
      </style>

                 <div class="FormContacto">
                      <h1 class="agileits w3 wthree w3-agile w3-agileits agileinfo agile">Formulario de Contacto</h1>
                      <div class="content-w3ls agileits w3 wthree w3-agile w3-agileits agileinfo agile">
                      	<form action="#" method="post" class="form-agileits">
                      		<h2>Contactenos</h2>
                      		<asp:TextBox ID="Nombre" name="username" placeholder="Nombre" title="Por favor introduzca su nombre" required="" runat="server"></asp:TextBox>
                      		
                      		<br />
                      		
                      		<asp:TextBox ID="mail" type="Email" runat="server" name="email" placeholder="MAIL@EJEMPLO.COM" title="Por favor ingrese una direccion de Email Valida" required=""></asp:TextBox>
                          
                              
                              <div class="form-group" style=" width:60%; margin:auto; margin-bottom:10px; ">
                            <label class="control-label" for="email" style=" color:#fff;opacity: 0.7;">Motivo de Contacto*</label>
                       
                            <span class="help-block" style="display: none;">Por favor, introduce una dirección de correo electrónico válida.</span><br />
                                 &nbsp;
                                  
                                  <asp:DropDownList ID="DropDownList1" runat="server" Height="33px" Width="233px" style="opacity: 0.6; background-color:#2e2d2d;color:#fff;">
                                  </asp:DropDownList>
                          </div>
                        	<asp:TextBox ID="Mensaje" runat="server" name="message" placeholder="MENSAJE" title="Por favor deje su mensaje" Height="86px" TextMode="MultiLine" Width="222px"></asp:TextBox>
                        	
                      		<asp:Button ID="Btn_Enviar" class="sign-in" runat="server"  OnClick="Button2_Click" Text="Enviar" />
                        	
                      		
                      	</form>
                      </div>

                    </div><!--contenido del form-->


  </body>
</html>


</asp:Content>
