<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="detalleCompra.aspx.cs" Inherits="Sistema_Kardex.Admin.detalleCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 100%;
    }
    .auto-style5 {
        height: 14px;
    }
        .auto-style9 {
            width: 952px;
        }
        .auto-style10 {
            height: 14px;
            width: 231px;
        }
        .auto-style15 {
            height: 12px;
            width: 42px;
        }
        .auto-style17 {
            width: 316px;
            height: 32px;
        }
        .auto-style20 {
            margin-left: 0px;
        }
        .auto-style21 {
            height: 12px;
            width: 144px;
        }
        .auto-style22 {
            height: 12px;
            width: 92px;
        }
        .auto-style23 {
            height: 12px;
            width: 88px;
        }
        .auto-style27 {
            width: 267px;
        }
        .auto-style28 {
            width: 119%;
            height: 115px;
        }
        .auto-style29 {
            height: 14px;
            width: 267px;
        }
        .auto-style32 {
            width: 267px;
            height: 32px;
        }
        .auto-style33 {
            width: 267px;
            height: 35px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <table class="auto-style2">
        <tr>
            <td class="auto-style10">
                <br />
        <h1>Compras</h1>
        <h4 class="auto-style9">Por favor especificar el comprobante de compra</h4>
                <p class="auto-style9">
                    <asp:TextBox ID="txtCod" runat="server" Visible="False"></asp:TextBox>
                </p>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:DropDownList ID="ListComprobante" runat="server" Height="28px" Width="126px">
                    <asp:ListItem>Factura</asp:ListItem>
                    <asp:ListItem>Ticket</asp:ListItem>
                    <asp:ListItem Value="Credito Fiscal">Credito Fiscal</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Height="28px" OnClick="btnAceptar_Click" />
                <br />
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">
                <br />
                <asp:Label ID="lblComprobante" runat="server" Text="Comprobante de compra:"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="txtComprobante" runat="server" Width="156px" ReadOnly="True"></asp:TextBox>
                <br />
                <table class="auto-style17">
                    <tr>
                        <td class="auto-style22">
                            <asp:Label ID="lblIdSala" runat="server" Text="Id Sala:"></asp:Label>
                        </td>
                        <td class="auto-style23">
                            <asp:TextBox ID="txtIdSala" runat="server" Width="28px"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                            <asp:Label ID="Label4" runat="server" Text="Id Proveedor:"></asp:Label>
                        </td>
                        <td class="auto-style15">
                            <asp:TextBox ID="txtIdProveedor" runat="server" CssClass="auto-style20" Width="30px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="lblProveedor" runat="server" Text="Proveedor:"></asp:Label>
                <asp:TextBox ID="txtProveedor" runat="server"></asp:TextBox>
                <br />
                <table class="auto-style28">
                    <tr>
                        <td class="auto-style29">
                            <asp:Label ID="lblIdProducto" runat="server" Text="Id Producto:"></asp:Label>
                            <asp:TextBox ID="txtIdProducto" runat="server" Width="42px"></asp:TextBox>
                        &nbsp;
                            <asp:Button ID="btnSeleccionar" runat="server" Text="Seleccionar" Width="88px" OnClick="btnSeleccionar_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style33">
                            <asp:Label ID="lblNom" runat="server" Text="Nombre Producto:"></asp:Label>
                            <asp:TextBox ID="txtNomProducto" runat="server" Width="115px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27">
                            <asp:Label ID="lblCantidad" runat="server" Text="Cantidad Comprada:"></asp:Label>
                            <asp:TextBox ID="txtCantidad" runat="server" Width="42px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style32">
                            <asp:Label ID="lblCompra" runat="server" Text="Compra Total:"></asp:Label>
                        &nbsp;
                            <asp:TextBox ID="txtCompraTotal" runat="server" Width="75px"></asp:TextBox>
                            <asp:Button ID="btnCalcular" runat="server" Text="Calcular" Width="64px" OnClick="btnCalcular_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27">
                        &nbsp;&nbsp;<asp:Label ID="lblPrecio" runat="server" Text="Valor Unitario:"></asp:Label>
                            <asp:TextBox ID="txtValorUnitario" runat="server" Width="77px" ReadOnly="True"></asp:TextBox>
                        &nbsp;<asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="62px" style="height: 34px" OnClick="btnGuardar_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Presione el Boton Finalizar"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Para guardar los detalles compra"></asp:Label>
                <br />
                <br />
                <asp:Button ID="btnFinalizar" runat="server" Text="Insertar Nueva Compra" OnClick="btnFinalizar_Click" Width="154px" />
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        </table>
    <br />
</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
    <br />
    Buscar por
    <asp:DropDownList ID="ListBusqueda" runat="server" Width="200px">
        <asp:ListItem Value="idproducto">Cod Producto</asp:ListItem>
        <asp:ListItem Value="IdCompra">Codgio Compra</asp:ListItem>
        <asp:ListItem Value="nombre_proveedor">Proveedor</asp:ListItem>
    </asp:DropDownList>
&nbsp;<asp:TextBox ID="txtBusqueda" runat="server" Width="187px"></asp:TextBox>
&nbsp; 
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
&nbsp;
        <asp:Button ID="btnVerTodo" runat="server" Text="Ver todo" />
    &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Reporte" />
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <p>
    <asp:GridView ID="GridViewCompras" runat="server" Width="484px">
        <HeaderStyle BackColor="#016D82" Font-Size="12pt" ForeColor="White" />
    </asp:GridView>
    <br />
</p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p>
    <asp:Label ID="Label3" runat="server"></asp:Label>
    <br />
</p>
</asp:Content>
