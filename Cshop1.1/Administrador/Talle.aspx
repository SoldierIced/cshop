<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Talle.aspx.cs" Inherits="Cshop1._1.Administrador.Talle" %>
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



    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Dar de alta un nuevo talle.</button>
    <br />
     <div class="card text-white bg-dark mb-3" style="width:100%">
    <div class="card-body">
    <h5 class="card-title">Talles</h5>
    <asp:GridView ID="GridView1" runat="server" class="table" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="Codigo">
                <EditItemTemplate>
                    <asp:Label ID="l_talle2" runat="server" Text='<%# Bind("c_talle") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="l_talle" runat="server" Text='<%# Bind("c_talle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Talle">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("detalle") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("detalle") %>'></asp:Label>
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
        <h3  class="modal-title" style="text-align:center; color: #ffffff" id="exampleModalLabel">Alta nuevo Talle</h3>
      <div class="modal-header">
          <button class="close" aria-label="Close" type="button" data-dismiss="modal">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <asp:Label ID="Label6" runat="server" style=" color: #ffffff" Text="Label">Talle</asp:Label>
         <asp:TextBox class="form-control" ID="t_talle" runat="server" ></asp:TextBox>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
       <asp:Button ID="Button2"  class="btn btn-primary" runat="server" Text="Aceptar" OnClick="Button1_Click1" />
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


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cshopConnectionString2 %>" SelectCommand="SELECT [c_talle], [detalle] FROM [talles]"></asp:SqlDataSource>

</asp:Content>
