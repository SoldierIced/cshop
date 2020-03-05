<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="ListadoComprasUser.aspx.cs" Inherits="Cshop1._1.Usuarios.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="row"> 
    <div class="col-md-4">
           
   </div> 
        <div class="col-md-4">
             <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" Height="187px" HorizontalAlign="Center" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="739px" CellPadding="4" ForeColor="#333333" GridLines="None">
                 <AlternatingRowStyle BackColor="White" />
                 <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>


            <br />

        <asp:Label ID="Label2" runat="server" Text="El Carrito Se Encuentra Vacio" Font-Bold="True" Font-Size="24pt" CssClass="alert-danger" style="margin-left:25%;"></asp:Label>
            <br />
            <br />
               <asp:GridView ID="grd_detalle" runat="server" Height="104px" HorizontalAlign="Center" Width="739px" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True">
                   <AlternatingRowStyle BackColor="White" />
                   <EditRowStyle BackColor="#7C6F57" />
                  <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
         </div> 
    <div class="col-md-4">

    </div>
    </div> 
</asp:Content>
