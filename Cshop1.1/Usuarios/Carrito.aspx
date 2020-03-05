<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Cshop1._1.Formulario_web13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="container">

        <asp:Label ID="MensajeCarroVacio" runat="server" Text="El Carrito Se Encuentra Vacio" Font-Bold="True" Font-Size="24pt" CssClass="alert-danger" style="margin-left:25%;"></asp:Label>
        <br /><br /><br />
        <asp:Image ID="carritoVacio" runat="server" style="margin-left:40%; width: 240px; height: 220px;" />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  GridLines="None"
                AllowPaging="True" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" PageSize="100" HorizontalAlign="Center">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
                    <asp:BoundField DataField="Articulo" HeaderText="Articulo" />
                    <asp:BoundField DataField="Detalle" HeaderText="Detalle" />
                    <asp:BoundField DataField="color" HeaderText="Color" />
                    <asp:BoundField DataField="talle" HeaderText="Talle" />
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />        
                    <asp:BoundField DataField="precio" HeaderText="Precio" />
                    <asp:TemplateField HeaderText="Seleccionado">
                        <ItemTemplate>
                            <asp:CheckBox ID="cb_select" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
    </asp:GridView>

        <br />
        <br />
        <br />

      </div>
    
    <div class="row">
    <div class="col-4"></div>
    <div class="col-2">
                
        <asp:ImageButton runat="server" id="vaciarCarrito" style="margin-left:47%; width: 92px; height: 92px;" Visible="False" OnClick="vaciarCarrito_Click" >
        </asp:ImageButton>
        <asp:Label ID="vaciar" runat="server" Text="Eliminar items Seleccionados."  style="margin-left:50px;  font-size:12px;"  CssClass="alert-dark" Visible="true"></asp:Label>
    </div>
    <div class="col-2">
        <asp:Button ID="btn_comprar" runat="server" Text="Comprar items seleccionados" OnClick="btn_comprar_Click" CssClass="btn btn-success" />

    </div>
    <div class="col-4"></div>
    </div>
    



    <style>
        * {
            padding: 0;
            margin: 0;
        }

            body {
                font: 14px Tahoma;
            }

                      

            #container {
                width: 700px;
                margin: 10px auto;
            }

            .mGrid {
                width: 100%;
                background-color: #fff;
                margin: 5px 0 10px 0;
                border: solid 1px #525252;
                border-collapse: collapse;
            }

                .mGrid td {
                    padding: 2px;
                    border: solid 1px #c1c1c1;
                    color: #717171;
                }

                .mGrid th {
                    padding: 4px 2px;
                    color: #fff;
                    background: #424242 url(grd_head.png) repeat-x top;
                    border-left: solid 1px #525252;
                    font-size: 16px;
                }

                .mGrid .alt {
                    background: #fcfcfc url(grd_alt.png) repeat-x top;
                }

                .mGrid .pgr {
                    background: #424242 url(grd_pgr.png) repeat-x top;
                }

                    .mGrid .pgr table {
                        margin: 5px 0;
                    }

                    .mGrid .pgr td {
                        border-width: 0;
                        padding: 0 6px;
                        border-left: solid 1px #666;
                        font-weight: bold;
                        color: #fff;
                        line-height: 12px;
                    }

                    .mGrid .pgr a {
                        color: #666;
                        text-decoration: none;
                    }

                        .mGrid .pgr a:hover {
                            color: #000;
                            text-decoration: none;
                        }

    </style>
</asp:Content>
