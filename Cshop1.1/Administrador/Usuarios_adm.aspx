<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Usuarios_adm.aspx.cs" Inherits="Cshop1._1.Administrador.Usuarios_adm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    &nbsp;&nbsp;&nbsp;
    <br />
    <div class="container">
    <div class="row">
  <div class="card text-white bg-dark mb-3">
     <div class="card-header" style="text-align:center;">
         <h4>Control de usuarios</h4>
     </div>
     <div class="card-body" style="text-align:center;">
   <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="C_usuario" AutoGenerateEditButton="True" Width="648px" Height="251px" OnRowEditing="GridView1_RowEditing" CellPadding="4" ForeColor="#333333" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating1">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Usuario" InsertVisible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("C_usuario") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_idUser" runat="server" Text='<%# Bind("C_usuario") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre" InsertVisible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_nombre" runat="server" Height="16px" style="margin-bottom: 0px" Text='<%# Bind("nombre") %>' Width="124px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_nombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Apellido" InsertVisible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_apellido" runat="server" Height="16px" style="margin-bottom: 0px" Text='<%# Bind("apellido") %>' Width="124px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_apellido" runat="server" Text='<%# Bind("apellido") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DNI" InsertVisible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_DNI" runat="server" Height="16px" style="margin-bottom: 0px" Text='<%# Bind("dni") %>' Width="124px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_dni" runat="server" Text='<%# Bind("dni") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" InsertVisible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Mail" runat="server" Height="16px" style="margin-bottom: 0px" Text='<%# Bind("email") %>' Width="223px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_mail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tipo" InsertVisible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Tipo" runat="server" Height="16px" style="margin-bottom: 0px" Text='<%# Bind("tipouser") %>' Width="124px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_tipo" runat="server" Text='<%# Bind("tipouser") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Estado">
                <EditItemTemplate>
                    <asp:TextBox ID="tb_estado" runat="server" Height="16px" style="margin-bottom: 0px" Text='<%# Bind("estado") %>' Width="124px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_estado" runat="server" Text='<%# Bind("estado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    </div>
  </div>
        </div>
    </div>






     

</asp:Content>
