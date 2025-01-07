<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/MenuUsuario.Master" AutoEventWireup="true" CodeBehind="VentasUsuario.aspx.cs" Inherits="Sistema_Kardex.Usuario.VentasUsuario" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            height: 33px;
            width: 666px;
        }
        .auto-style14 {
            height: 33px;
            width: 767px;
        }
        .auto-style17 {
            width: 76px;
        }
        .auto-style18 {
            width: 131%;
            height: 158px;
        }
        .auto-style19 {
            width: 104px;
        }
        .auto-style20 {
            width: 232px;
        }
        .auto-style23 {
            width: 104px;
            height: 38px;
        }
        .auto-style24 {
            width: 76px;
            height: 38px;
        }
        .auto-style25 {
            width: 232px;
            height: 38px;
        }
        .auto-style26 {
            width: 593px;
        }
        .auto-style27 {
            height: 33px;
            width: 593px;
        }
        .auto-style28 {
            height: 190px;
            width: 593px;
        }
        .auto-style29 {
            width: 594px;
        }
        .auto-style30 {
            height: 33px;
            width: 594px;
        }
        .auto-style31 {
            height: 190px;
            width: 594px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <h1>Ventas</h1>
    <p>&nbsp;
        <h4>Por favor especificar el comprobante de venta</h4>
    <table class="auto-style2">
        <tr>
            <td class="auto-style14">
                <asp:DropDownList ID="ListComprobante" runat="server" Height="28px" Width="126px">
                    <asp:ListItem>Factura</asp:ListItem>
                    <asp:ListItem>Ticket</asp:ListItem>
                    <asp:ListItem Value="Credito Fiscal">Credito Fiscal</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Aceptar" Height="28px" />
            &nbsp;&nbsp;
    <asp:Button ID="btnNuevaVenta" runat="server" OnClick="btnNuevaVenta_Click" Text="Nueva Venta" Visible="False" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="auto-style4">
            &nbsp;<asp:TextBox ID="txtCod" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
                </td>
        </tr>
    </table>
    <table class="auto-style2">
        <tr>
            <td class="auto-style29">
                <br />
                <br />
                <asp:Label ID="lblTipoDocument" runat="server" Visible="False">Tipo documento a emitir:</asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;
                <br />
                <br />
                <asp:TextBox ID="txtTipo" runat="server" ReadOnly="True" Visible="False" Width="150px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblIdSala" runat="server" Visible="False">Id Sala:</asp:Label>
                <asp:TextBox ID="txtIdSala" runat="server" Width="35px" Visible="False"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblNIT" runat="server" Visible="False">NIT:</asp:Label>
                <asp:TextBox ID="txtNit" runat="server" Visible="False" Width="69px"></asp:TextBox>
                <br />
            </td>
            <td class="auto-style26">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <rsweb:ReportViewer ID="RVTicket" runat="server" Height="36px" Visible="False" Width="78px">
                </rsweb:ReportViewer>
                <rsweb:ReportViewer ID="RVCreditoFiscal" runat="server" Height="42px" Width="377px">
                </rsweb:ReportViewer>
                <br />
&nbsp;
                </td>
        </tr>
        <tr>
            <td class="auto-style30">
                <asp:Label ID="lblCliente" runat="server" Visible="False">Cliente:</asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtCliente" runat="server" Visible="False" Width="209px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LBLNRC" runat="server" Visible="False">NRC:</asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtNRC" runat="server" Visible="False" Width="69px"></asp:TextBox>
                <br />
                <br />
                <br />
&nbsp;<asp:Label ID="lblDireccion" runat="server" Visible="False">Direccion:</asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtDireccion" runat="server" Visible="False" Width="209px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;<br />
                <asp:Label ID="lblGiro" runat="server" Visible="False">Giro:</asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtGiro" runat="server" Visible="False" Width="88px"></asp:TextBox>
            </td>
            <td class="auto-style27">
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
                &nbsp;
                <br />
                <br />
                <br />
                &nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td class="auto-style31">
                <table class="auto-style18">
                    <tr>
                        <td class="auto-style23">
                            <br />
                <asp:Label ID="lblIdPro" runat="server" Text="Id Producto:" Visible="False"></asp:Label>
                            <br />
                            <br />
                        </td>
                        <td class="auto-style24">
                <asp:TextBox ID="txtIdPro" runat="server" Width="32px" Visible="False"></asp:TextBox>
                        </td>
                        <td class="auto-style25"><asp:Button ID="btnBuscar" runat="server" Text="Seleccionar" OnClick="btnBuscar_Click" Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19">
                <asp:Label ID="lblPro" runat="server" Text="Producto:" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style17">
                <asp:TextBox ID="txtProducto" runat="server" Width="141px" Visible="False" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="auto-style20">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style19">
                <asp:Label ID="lblCantidad" runat="server" Text="Cantidad:" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style17">
                <asp:TextBox ID="txtCantidad" runat="server" Width="43px" Visible="False"></asp:TextBox>
                        </td>
                        <td class="auto-style20">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style19">
                <asp:Label ID="lblVU" runat="server" Text="Valor unitario:" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style17">
                <asp:TextBox ID="txtVU" runat="server" Width="43px" Visible="False" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="auto-style20"><asp:Button ID="btnCalcular" runat="server" Text="Calcular" OnClick="btnCalcular_Click" Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19"><asp:Label ID="lblTotal" runat="server" Text="Total:" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style17">
                <asp:TextBox ID="txtTotal" runat="server" Width="43px" Visible="False"></asp:TextBox>
                        </td>
                        <td class="auto-style20">&nbsp;</td>
                    </tr>
                </table>
                </td>
            <td class="auto-style28">
                <br />
    <rsweb:ReportViewer ID="RVFactura" runat="server" Height="35px" Visible="False" Width="549px">
    </rsweb:ReportViewer>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style30">
                &nbsp;<asp:Button ID="btnIngresar" runat="server" OnClick="btnIngresar_Click" Text="Ingresar" Visible="False" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="auto-style27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        </tr>
        </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        &nbsp;<br />
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:Button ID="btnGenerar" runat="server" Text="Generar Comprobante" Visible="False" OnClick="btnGenerar_Click" />
    &nbsp;&nbsp;&nbsp;
        <br />
    <asp:GridView ID="GridViewVentas" runat="server" BackColor="White" BorderColor="#016D82" BorderStyle="Double" BorderWidth="1px" CellPadding="1" GridLines="Horizontal" Height="114px" Width="577px"  Visible="False">
        <FooterStyle BackColor="White" ForeColor="#016D82" />
        <HeaderStyle BackColor="#016D82" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#016D82" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </asp:Content>
