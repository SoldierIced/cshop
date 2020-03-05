<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TiposRopa.aspx.cs" Inherits="Cshop1._1.TiposRopa" %>
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
                this.Session["error"] = null; }
        }
        %>



   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Dar de alta un nuevo tipo de ropa.</button>
    <br />
     <div class="card text-white bg-dark mb-3" style="width:100%">
    <div class="card-body">
    <h5 class="card-title">Tipos de Ropa</h5>
        <asp:GridView ID="GridView1" runat="server" class="table" AutoGenerateEditButton="True" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Codigo">
                    <EditItemTemplate>
                        <asp:Label ID="l_tiporopa2" runat="server" Text='<%# Bind("c_tiporopa") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="l_tiporopa" runat="server" Text='<%# Bind("c_tiporopa") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Detalle">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" style="margin-bottom: 9px" Text='<%# Bind("detalle") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("detalle") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
</asp:GridView>
    </div>
    </div> 
    


    
    <div class="bd-example" style="background-color:dimgrey">
<div tabindex="-1" class="modal fade" id="exampleModal" role="dialog" aria-hidden="true" aria-labelledby="exampleModalLabel" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="background-color:dimgrey">
        <h3  class="modal-title" style="text-align:center; color: #ffffff" id="exampleModalLabel">Alta nuevo tipo de ropa</h3>
      <div class="modal-header">
          <button class="close" aria-label="Close" style=" color: #ffffff" type="button" data-dismiss="modal">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        
        
          <div class="form-group">
            <asp:Label ID="Label6" runat="server" style=" color: #ffffff" Text="Label">Detalle (nombre de la categoria de ropa)</asp:Label>
         <asp:TextBox class="form-control" ID="t_detalle" runat="server" ></asp:TextBox>
          </div>
       
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
       <asp:Button ID="Button1"  class="btn btn-primary" runat="server" Text="Aceptar" OnClick="Button1_Click1" />
      </div>
    </div>
  </div>
</div>
</div>
  
    <script>


        $('#exampleModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
 
  //modal.find('.modal-body input').val(recipient)
})


    </script>
</asp:Content>
