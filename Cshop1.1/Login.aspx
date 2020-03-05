<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cshop1._1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            left: 15px;
            top: 349px;
            height: 14px;
        }
        .auto-style2 {
            left: 15px;
            top: 441px;
            width: 105px;
            height: 16px;
        }
       
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <!DOCTYPE html>

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>Logearse</title>
    <link href="./login_files/bootstrap.min.css" rel="stylesheet">
    <link href="./login_files/signin.css" rel="stylesheet">
  </head>

  
    <body >
        <div class="text-center" style="width:34%; margin:auto;">
    <form class="form-signin">
      
      <h1 class="h3 mb-3 font-weight-normal">Por favor ingrese sus datos</h1>
        <br />
        <div class ="text-center">
            <asp:Label ID="Label1" runat="server"  class="sr-only"  Text="Label" CssClass="auto-style1">Ingrese correo electronico</asp:Label>
        <br />
        <asp:TextBox ID="email" type="email"  class="form-control" required="" autofocus="" placeholder="Email" runat="server"></asp:TextBox>
        <br />
        
        </div>
        <asp:Label ID="Label2" runat="server"  class="sr-only" Text="Label" CssClass="auto-style2">Contraseña</asp:Label>
       <asp:TextBox ID="contrase" type="password"  class="form-control" placeholder="Ingrese Contraseña" runat="server"></asp:TextBox>
       
      <div class="checkbox mb-3">
        <label>
            <asp:CheckBox ID="CheckBox1"  text="remember-me" runat="server" />
          
        </label>
      </div>
         <asp:Button ID="Logear" runat="server" Text="Iniciar sesion" class="btn btn-lg btn-primary btn-block" OnClick="Logear_Click" />

     <p class="mt-5 mb-3 text-muted">© 2017-2018</p>
    </form>
  
            </div>
</body>
</asp:Content>
