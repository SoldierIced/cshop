<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Alta_Sucursal.aspx.cs" Inherits="Cshop1._1.Alta_Sucursal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <br />
    <br />
    <asp:Button ID="Button1" runat="server"  CssClass="btn btn-sm btn-outline-secondary" Text="Nueva Sucursal" />
    <br />
    <br />
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateEditButton="True" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
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

    
</asp:Content>
