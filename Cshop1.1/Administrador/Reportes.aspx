<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Cshop1._1.Administrador.Reportes" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Chart ID="masvendidos" runat="server">
    <series>
        <asp:Series Name="0" IsValueShownAsLabel="True">
        </asp:Series>
    </series>
    <chartareas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </chartareas>
        <Titles>
            <asp:Title Name="title" Text="Articulos mas vendidos">
            </asp:Title>
        </Titles>
</asp:Chart>
    <asp:Chart ID="masrecaudado" runat="server">
        <Series>
            <asp:Series ChartType="StackedBar" Name="0" YValuesPerPoint="6" IsValueShownAsLabel="True">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
        <Titles>
            <asp:Title Name="Title1" Text="Mas recaudado por Articulo">
            </asp:Title>
        </Titles>
    </asp:Chart>
    <asp:Chart ID="masvendicolor" runat="server" Height="240px" Width="261px">
        <Series>
            <asp:Series Name="0" IsValueShownAsLabel="True">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
        <Titles>
            <asp:Title Name="Title1" Text="Colores mas vendidos">
            </asp:Title>
        </Titles>
    </asp:Chart>
</asp:Content>
