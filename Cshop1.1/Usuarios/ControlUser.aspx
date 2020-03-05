<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="ControlUser.aspx.cs" Inherits="Cshop1._1.Usuarios.ControlUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     
    <div class="container" style="margin-top:30px;">
        <div class="card text-center">
            <div class="card-header">Mi Cuenta</div>
            <div class="card-body">
                <%if (edit == false)
                    {  %> 
                <p class="card-text">Desde aqui tiene la posibilidad de Modificar sus Datos Personales</p>
                <asp:Button ID="Button1" runat="server" Text="Ver Perfil" CssClass="btn btn-primary" OnClick="Button1_Click" />
                 <% } %>
                 <% else {%>

                     <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">N°</span>
                            </div>
                         <asp:Label ID="idUser" runat="server" Text="" placeholder="Codigo Usuario" aria-label="N Usuario" aria-describedby="basic-addon1" CssClass="form-control"></asp:Label>
                          
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Nombre</span>
                            </div>
                            <asp:TextBox ID="txt_nombre" runat="server" ForeColor="Black" CssClass="form-control" BorderWidth="1px" BorderColor="#ced4da"></asp:TextBox>
                        </div>
       
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon3">Apellido</span>
                            </div>
                            <asp:TextBox ID="txt_apellido" runat="server" aria-describedby="basic-addon3" CssClass="form-control" ForeColor="Black" BorderWidth="1px" BorderColor="#ced4da"></asp:TextBox>
                        </div>
    
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon4">DNI</span>
                            </div>
                             <asp:TextBox ID="txt_dni" runat="server" aria-describedby="basic-addon4" CssClass="form-control" ForeColor="Black" BorderWidth="1px" BorderColor="#ced4da"></asp:TextBox>
                        </div>
                         <div class="input-group mb-3">
                                     <asp:TextBox ID="txt_mail" runat="server" placeholder="Email" aria-label="Email" aria-describedby="basic-addon7" CssClass="form-control"  ForeColor="Black" BorderWidth="1px" BorderColor="#ced4da"></asp:TextBox>

                                    <div class="input-group-append">
                                        <span class="input-group-text" id="basic-addon7">Email@example.com</span>
                                    </div>
                                </div>
                        <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon8">Contraseña</span>
                                    </div>
                                     <asp:TextBox ID="txt_pass" runat="server" aria-describedby="basic-addon8" CssClass="form-control" ForeColor="Black" BorderWidth="1px" BorderColor="#ced4da"></asp:TextBox>
                                </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon5">Tipo Usuario</span>
                            </div>
                            <asp:TextBox ID="txt_tipo" runat="server" aria-describedby="basic-addon5" CssClass="form-control" ForeColor="Black" BorderWidth="1px" BorderColor="#ced4da" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon6">Estado</span>
                            </div>
                             <asp:TextBox ID="txt_estado" runat="server" aria-describedby="basic-addon6" CssClass="form-control" ForeColor="Black" BorderWidth="1px" BorderColor="#ced4da" ReadOnly="True"></asp:TextBox>
                        </div>
                       
                <asp:Button ID="Button2" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="Button3_Click" />
                     <% } %>
                
            </div>
            <div class="card-footer text-muted">
            </div>
        </div>
        <br /><br />
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Carrito</h5>
                        <p class="card-text">Visualizacion de productos agregados al carrito y posibilidad de Completar compras</p>
                        <a href="<%Response.Write(gl.carrito);%>" class="btn btn-primary">Ir a Carrito</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Lista de Compras</h5>
                        <p class="card-text ">Resumen de todos aquellas compras realizadas.</p>
                        <a href="<%Response.Write(gl.ListaCompras);%>" class="btn btn-primary">Ver Compras</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
</asp:Content>





<%--<div class="container" id="contenedorEditor" style="display:none">
       <div class="row">
           <div class="col-4"></div>
           <div class="col-4">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">N°</span>
        </div>
        <input type="text" class="form-control" placeholder="Codigo Usuario" aria-label="N Usuario" aria-describedby="basic-addon1">
    </div>

    <label for="basic-url">Su Nombre</label>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon2">Nombre</span>
        </div>
        <input type="text" class="form-control" id="nombre" aria-describedby="basic-addon2">
    </div>
       
    <label for="basic-url">Su Apellido</label>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon3">Apellido</span>
        </div>
        <input type="text" class="form-control" id="apellido" aria-describedby="basic-addon3">
    </div>
    
    <label for="basic-url">Su DNI</label>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon4">DNI</span>
        </div>
        <input type="text" class="form-control" id="dni" aria-describedby="basic-addon4">
    </div>
    <label for="basic-url">Tipo de Usuario</label>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon5">Tipo Usuario</span>
        </div>
        <input type="text" class="form-control" id="tipo" aria-describedby="basic-addon5">
    </div>
    <label for="basic-url">Estado</label>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon6">Estado</span>
        </div>
        <input type="text" class="form-control" id="estado" aria-describedby="basic-addon6">
    </div>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="basic-addon7">
        <div class="input-group-append">
            <span class="input-group-text" id="basic-addon7">Email@example.com</span>
        </div>
    </div>
               </div>
           <div class="col-4"></div>
           </div>
    </div>--%>