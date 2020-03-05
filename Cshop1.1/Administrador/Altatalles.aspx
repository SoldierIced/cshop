<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Altatalles.aspx.cs" Inherits="Cshop1._1.Administrador.Altatalles" %>
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
    <% if (this.Session["select"] != null) { 
        string [] selec= (string[])this.Session["select"];

        string val = "<h5 class=\"card-title\">Talles del articulo: "+selec[1]+"</h5>"; %>
  
     <div class="card text-white bg-dark mb-3" style="width:100%">
  
  <div class="card-body" >
      <%=val%>
    <asp:gridview runat="server" class="table" AutoGenerateColumns="False" AutoGenerateEditButton="True" ID="gv_talles" OnRowCancelingEdit="gv_talles_RowCancelingEdit" OnRowEditing="gv_talles_RowEditing" OnRowUpdating="gv_talles_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="Talle">
                <EditItemTemplate>
                    <asp:Label ID="lb_talle" runat="server" Text='<%# Bind("detalle") %>'></asp:Label>
                    <asp:Label ID="lb_tallecodigo" runat="server" BackColor="#333333" Text='<%# Bind("c_talle") %>' Visible="False"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_talle" runat="server" Text='<%# Bind("detalle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contiene">
                <EditItemTemplate>
                    <asp:DropDownList ID="dd_contiene" runat="server" Height="16px" Width="75px" ForeColor="#333333">
                        <asp:ListItem>SI</asp:ListItem>
                        <asp:ListItem>NO</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_contiene" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
      </asp:gridview>

   </div>
</div> 

    <%} %>
    
    

</asp:Content>
