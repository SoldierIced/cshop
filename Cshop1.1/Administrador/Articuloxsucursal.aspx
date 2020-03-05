<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Articuloxsucursal.aspx.cs" Inherits="Cshop1._1.Administrador.Articuloxsucursal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- validacion de mensaje de error o mensajes OK  -->
     <%  if (this.Session["msj"] != null)
    {    %><% String var = this.Session["msj"].ToString(); %>
            <div class="alert alert-success" style="width:40%;" role="alert"> 
 <%=var%></div>
    <%this.Session["msj"] = null;
            }
            else
            { if (this.Session["error"] != null) {
                String var = this.Session["error"].ToString(); %>
            <div class="alert alert-danger" style="width:40%;" role="alert"> 
 <%=var%></div>
    <%
         }}
        %>

       <!-- --------------------------------------------------->



    
       <!-- PEDIR SUCURSAL  -->
   
    <div class="modal-content" style="text-align:center;">
        <asp:Label ID="Label3"  runat="server" Text="Elija la sucursal que desee para ver los productos."></asp:Label>
        <br/>
        <asp:DropDownList ID="dd_sucursales" runat="server" Height="16px" Width="396px" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="c_sucursal"></asp:DropDownList>
    
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cshopConnectionString2 %>" SelectCommand="SELECT [c_sucursal], [nombre] FROM [sucursales]"></asp:SqlDataSource>
    
         <div class="modal-footer" style="align-content:center; text-align:center;">
             &nbsp;<asp:Button ID="btn_cancelarsuc" class="btn btn-secondary" runat="server" Text="Cancelar" OnClick="btn_cancelarsuc_Click" Height="31px" Width="109px" />
            
             <asp:Button ID="btn_aceptarsuc"  class="btn btn-primary" runat="server" Text="Aceptar" OnClick="btn_aceptarsuc_Click" Height="31px" Width="109px" />
         </div>
    </div>
    <%

   if (this.Session["sucursal"] != null){ 
        %>

    <!-- -------------------------------------- -->

    &nbsp;
      <br />
      <br />

        <div class="card text-white bg-dark mb-3" style="width:100%">
  
  <div class="card-body" >
   
      <h5 class="card-title">Articulos</h5>
        <asp:GridView ID="gv_artxsuc" runat="server" class="table" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="gv_artxsuc_RowCancelingEdit" OnRowEditing="gv_artxsuc_RowEditing" OnRowUpdating="gv_artxsuc_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="Articulo">
                <EditItemTemplate>
                    <asp:Label ID="lb_nombre" runat="server" Text='<%# Bind("nombreArt") %>'></asp:Label>
                    <br />
                    <asp:Label ID="lb_codigo" runat="server" Text='<%# Bind("c_articulo") %>' Visible="False"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_nombre" runat="server" Text='<%# Bind("nombreArt") %>'></asp:Label>
                    <br />
                    <asp:Label ID="lb_codigo" runat="server" Text='<%# Bind("c_articulo") %>' Visible="False"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Talle">
                <EditItemTemplate>
                    <asp:Label ID="lb_talle" runat="server" Text='<%# Bind("detalle") %>'></asp:Label>
                    <asp:Label ID="lb_ctalle" runat="server" Text='<%# Bind("c_talle") %>' Visible="False"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_talle" runat="server" Text='<%# Bind("detalle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stock">
                <EditItemTemplate>
                    <asp:TextBox ID="tb_stock" runat="server" Height="16px" style="margin-bottom: 0px" Text='<%# Bind("stock") %>' Width="163px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("stock") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
   </div>
</div> 
  

    <%} %>
</asp:Content>
