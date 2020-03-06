<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Cshop1._1.Administrador.Productos" %>
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
  
    
    <style>
        input {
            background-color:white !important;
        }
    </style>
    
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Dar de alta nuevo Producto.</button>
    &nbsp;
      <br />
   
  

   
      <br />

    <%--botones que muestran las opciones del articulo seleccionado--%><%if (Session["select"] != null) {

          string [] selec= (string[])this.Session["select"];
            lb_seleccionado.Text = selec[1];

        %>
    <div style="margin-left:10%; margin-right:10%; text-align:center; background-color:#ffffff">
             <h4 style="color:black;">Articulo seleccionado</h4>
                <asp:Label ID="lb_seleccionado" style="height: 23px; background-color:#ffffff; width: 224px; margin-bottom: 0px"  runat="server" Text=""></asp:Label>
                <div style="text-align:center; ">
                     <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal2" data-whatever="@getbootstrap">Administrar colores.</button>
                    <asp:Button ID="Button2"  class="btn btn-secondary" runat="server" Text="Administrar talles" OnClick="Button2_Click" />
                  
                 </div>
    
    </div>
      <%
                
                
            } %>
    <br />
   
<%--    --------------------------------------------------------%>      
    <%--  grid view de articulos  --%>
    <div class="card text-white bg-dark mb-3" style="width:100%">
    <div class="card-body" style="width:100%" >
    <h5 class="card-title">Productos</h5>
    <asp:GridView ID="GridView1" style="width:auto;border: none;border-collapse: collapse;" class="table"  runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" PageSize="25">
        <Columns >
            <asp:TemplateField HeaderText="codigo">
                <EditItemTemplate>
                    <asp:Label ID="l_articulo2" runat="server" Text='<%# Bind("c_articulo") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="l_codigo" runat="server" Text='<%# Bind("c_articulo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tipo de Ropa">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="detalle" style=" background-color: #000;" DataValueField="c_tiporopa" Height="16px" OnDataBound="DropDownList1_DataBound" Width="122px" CssClass="cuadrados">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REAL %>" SelectCommand="SELECT * FROM [tipoRopa]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("detalle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Detalle">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("detallear") %>' Height="16px" style="margin-bottom: 0px;  background-color: #000;" Width="150px" CssClass=""></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("detallear") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Precio">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("precio") %>' style=" background-color: #000;" Height="16px" Width="110px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("precio") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Imagen">
                <EditItemTemplate>
                    <asp:FileUpload ID="fu_url2" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" Height="56px" ImageUrl='<%# Bind("url") %>' Width="84px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
   </div>
</div> 


<%--    MODAL de alta de articulos--%>


    <div class="bd-example" >
<div tabindex="-1" class="modal fade" id="exampleModal" role="dialog" aria-hidden="true" aria-labelledby="exampleModalLabel" style="display: none;">
  <div class="modal-dialog" role="document" >
    <div class="modal-content" style="background-color: #808080;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Alta nuevo articulo</h5>
        <button class="close" aria-label="Close" type="button" data-dismiss="modal">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
       
          <div class="form-group">
        <asp:Label ID="Label5" runat="server" Text="Label" style="color:aliceblue;">Nombre Producto</asp:Label>
         <asp:TextBox class="form-control" ID="nombreproducto" runat="server" style="background-color: #ffffff; color:#000;" ></asp:TextBox>
          </div>
          <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Label" style="color:aliceblue;">Detalle </asp:Label>
         <asp:TextBox class="form-control" ID="detalleproducto" runat="server" style="background-color: #ffffff; color:#000;" ></asp:TextBox>
          </div>
            <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Label" style="color:aliceblue;">Detalle </asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server" OnLoad="DropDownList2_Load" style="background-color: #ffffff; color:#000;"></asp:DropDownList>
                </div>
      <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Label" style="color:aliceblue;">URL </asp:Label>
            <%--<asp:TextBox class="form-control" ID="tb_url2" ValidateRequestMode="Enabled" runat="server" style="background-color: #ffffff; color:#000;" ></asp:TextBox>--%>
          <asp:FileUpload ID="fu_url" runat="server" />
                </div>
          <asp:Label ID="Label2" runat="server" Text="Label" style="color:aliceblue;">Precio </asp:Label>
           <asp:TextBox class="form-control" ID="precioproducto" ValidateRequestMode="Enabled" runat="server" style="background-color: #ffffff; color:#000;" ></asp:TextBox>
      </div>
      
      
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
       <asp:Button ID="Button1"  class="btn btn-primary" runat="server" Text="Aceptar" OnClick="Button1_Click" />
      </div>

    </div>
  </div>
</div>
</div>
  


    <%--modal  configuracion de colores x articulos --%>

   
    <div class="bd-example" >
<div tabindex="-1" class="modal fade" id="exampleModal2" role="dialog" aria-hidden="true" aria-labelledby="exampleModalLabel" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="background-color: #808080;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel2">Colores del articulo</h5>
      

          <%     string var2 = "";
              if (this.Session["select"] != null)
              {
                  string[] selec = (string[])this.Session["select"];


                 var2 = " <h5 class=\"card-title\">Colores del articulo " + selec[1] + "</h5>";
              }
       %>
     
        

          <button class="close" aria-label="Close" type="button" data-dismiss="modal">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group">
    
          </div>
           
     <div class="card text-white bg-dark mb-3" style="width:100%">
          <div class="card-body" >
              <%=var2%>
         </div>
   

         <asp:GridView ID="gv_colores" runat="server"  class="table" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="gv_colores_RowCancelingEdit" OnRowEditing="gv_colores_RowEditing" OnRowUpdating="gv_colores_RowUpdating">
          <Columns>
              <asp:TemplateField HeaderText="Codigo">
                  <EditItemTemplate>
                      <asp:Label ID="Label11" runat="server" Text='<%# Bind("c_color") %>'></asp:Label>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label10" runat="server" Text='<%# Bind("c_color") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Detalle">
                  <EditItemTemplate>
                      <asp:Label ID="Label13" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label12" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Imagen">
                  <EditItemTemplate>
                      <asp:Image ID="Image1" runat="server" Height="35px" ImageUrl='<%# Bind("url") %>' Width="36px" />
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Image ID="Image1" runat="server" Height="35px" ImageUrl='<%# Bind("url") %>' Width="36px" />
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Contiene:">
                  <EditItemTemplate>
                      <asp:DropDownList ID="DropDownList3" runat="server" Height="16px" Width="120px" BackColor="#333333">
                          <asp:ListItem Value="SI">SI</asp:ListItem>
                          <asp:ListItem Value="NO">NO</asp:ListItem>
                      </asp:DropDownList>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="lb_pertenece" runat="server" Text="Label"></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
      </asp:GridView>
      </div>
           
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
       
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

           $('#exampleModal2').on('show.bs.modal', function (event) {
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
