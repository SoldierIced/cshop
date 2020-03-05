<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Cshop1._1.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <!DOCTYPE html>

<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
  
    <%--   class="text-center"--%>
    <title>Registrarse</title>1
    <link href="./login_files/bootstrap.min.css" rel="stylesheet">
    <link href="./login_files/signin.css" rel="stylesheet">
  </head>

  <%-- class="text-center"--%>
    
    <div class="text-center" style="width:33%; margin-left:33%; margin-right:33%;">
    <form class="form-signin">
    
      <h1 class="h3 mb-3 font-weight-normal">Por favor ingrese sus datos</h1>

       
      
        <br />
        <br />
        <asp:Label ID="Label1" runat="server"  class="sr-only" Text="Label" CssClass="auto-style1">Nombre:</asp:Label>
        <br />
        <asp:TextBox ID="nombre"   class="form-control" required=""  autofocus="" placeholder="Nombre" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server"  class="sr-only" Text="Label" CssClass="auto-style2">Apellido</asp:Label>
       <asp:TextBox ID="apellido"   class="form-control" required=""  placeholder="Apellido" runat="server"></asp:TextBox>
       
        <asp:Label ID="Label3" runat="server"  class="sr-only" Text="Label" CssClass="auto-style2">DNI</asp:Label>
       <asp:TextBox ID="dni"  class="form-control" placeholder="DNI" required=""  runat="server"></asp:TextBox>

        <asp:Label ID="Label4" runat="server"  class="sr-only" Text="Label" CssClass="auto-style2">Email</asp:Label>
     
       &nbsp;<br />
     
       <asp:TextBox ID="email" type="email"  class="form-control" placeholder="Email" runat="server"></asp:TextBox>
        
        <asp:Label ID="Label5" runat="server"  class="sr-only" Text="Label" CssClass="auto-style2">Contraseña</asp:Label>
       <asp:TextBox ID="contraseña" type="password"  class="form-control" required="" placeholder="Contraseña" runat="server"></asp:TextBox>
       
       

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
         <asp:Button ID="Logear" runat="server" Text="Registrarse" class="btn btn-lg btn-primary btn-block" OnClick="Logear_Click" />

     <p class="mt-5 mb-3 text-muted">© 2017-2018</p>
    </form>
  </div>
    </html>











</asp:Content>
