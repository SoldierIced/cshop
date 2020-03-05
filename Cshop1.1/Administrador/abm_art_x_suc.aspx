<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="abm_art_x_suc.aspx.cs" Inherits="Cshop1._1.Administrador.abm_art_x_suc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <%
    if (this.Session["msj"] != null)
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
       <!-- PEDIR SUCURSAL  -->
    <br />
    <div class="modal-content" style="text-align:center;">
        <asp:Label ID="Label3"  runat="server" Text="Elija la sucursal que desee para ver los productos."></asp:Label>
        <br/>
        <asp:DropDownList ID="dd_sucursales" runat="server" Height="16px" Width="396px" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="c_sucursal"></asp:DropDownList>
    
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cshopConnectionString2 %>" SelectCommand="SELECT [c_sucursal], [nombre] FROM [sucursales]"></asp:SqlDataSource>
    
         <div class="modal-footer" style="align-content:center; text-align:center;">
             &nbsp;<asp:Button ID="btn_cancelarsuc" class="btn btn-secondary" runat="server" Text="Cancelar" Height="31px" Width="109px" />
             <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Aceptar" Height="31px" Width="109px" />
         </div>
    </div>
    <br />
       <%if (this.Session["sucursal"] != null && gv_arti.Rows.Count!=0) {
          %>
         
     <div class="card text-white bg-dark mb-3" style="width:100%">
        <div class="card-body">
            <h5 class="card-title">Articulos</h5>
            <asp:GridView runat="server" AutoGenerateColumns="False" class="table" AutoGenerateEditButton="True" ID="gv_arti" OnRowCancelingEdit="gv_arti_RowCancelingEdit" OnRowEditing="gv_arti_RowEditing" OnRowUpdating="gv_arti_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="Articulo">
                        <EditItemTemplate>
                            <asp:Label ID="lb_articulo" runat="server" Text='<%# Bind("NombreArt") %>'></asp:Label>
                            <br />
                            <asp:Label ID="lb_codart" runat="server" Text='<%# Bind("c_articulo") %>' Visible="False"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lb_articulo" runat="server" Text='<%# Bind("NombreArt") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Talle">
                        <EditItemTemplate>
                            <asp:Label ID="lb_detalle" runat="server" Text='<%# Bind("detalle") %>'></asp:Label>
                            <asp:Label ID="lb_codtall" runat="server" Text='<%# Bind("c_talle") %>' Visible="False"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lb_detalle" runat="server" Text='<%# Bind("detalle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contiene">
                        <EditItemTemplate>
                            <asp:DropDownList ID="dd_contiene" runat="server" Height="18px" Width="75px">
                                <asp:ListItem>SI</asp:ListItem>
                                <asp:ListItem>NO</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lb_contiene" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div> 


      <% } %>

</asp:Content>
