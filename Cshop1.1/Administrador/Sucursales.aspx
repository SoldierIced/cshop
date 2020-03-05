<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Sucursales.aspx.cs" Inherits="Cshop1._1.Sucursales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <br />
        <%
    if (this.Session["msj"] != null)
    {    %>
   <% String var = this.Session["msj"].ToString(); %>
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



   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Dar de alta nueva sucursal.</button>
    <br />
    <br />
   <div class="card text-white bg-dark mb-3" style="width:100%">
  
  <div class="card-body">
    <h5 class="card-title">Sucursales</h5>
     <asp:GridView ID="GridView1" runat="server" class="table" AutoGenerateEditButton="True" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowUpdated="GridView1_RowUpdated">
        <Columns>
            <asp:TemplateField HeaderText="Codigo Sucursal">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("c_sucursal") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("c_sucursal") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre Sucursal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Direccion Sucursal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("direccion") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("direccion") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
  </div>
</div> 
   

    <div class="bd-example" style="background-color:dimgrey">
<div tabindex="-1" class="modal fade" id="exampleModal"  role="dialog" aria-hidden="true" aria-labelledby="exampleModalLabel" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="background-color:dimgrey">
    
         <div class="modal-header">
          
        <h5 class="modal-title" style=" color: #ffffff" id="h4">Recuerde que la direccion tiene que ser: /images/nombrecarpeta/archivo.formato</h5>
        <button class="close" aria-label="Close" type="button" data-dismiss="modal">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
        <asp:Label ID="Label5" runat="server" style=" color: #ffffff" Text="Label">Nombre sucursal</asp:Label>
         <asp:TextBox class="form-control" ID="nombreSucursal" runat="server" ></asp:TextBox>
          </div>
          <div class="form-group">
            <asp:Label ID="Label6" runat="server" style=" color: #ffffff" Text="Label">Direccion de la sucursal</asp:Label>
         <asp:TextBox class="form-control" ID="DireccionSucursal" runat="server" ></asp:TextBox>
          </div>
        </form>
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
  modal.find('.modal-title').text('Dar de alta una Sucursal')
  //modal.find('.modal-body input').val(recipient)
})


    </script>
</asp:Content>
