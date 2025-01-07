<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="Bodegas.aspx.cs" Inherits="Sistema_Kardex.Admin.Bodegas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Agregar Productos a bodegas</h1>
    <table class="auto-style2">
    <tr>
        <td class="auto-style3">Codigo de Sala de Venta:
            <asp:TextBox ID="txtSala" runat="server" ></asp:TextBox>
        </td>
        <td class="auto-style3">&nbsp;Codigo de producto :
            <asp:TextBox ID="txtProducto" type="number"  runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="btnAgregarProducto" runat="server" Text="Agregar Producto" OnClick="btnAgregarProducto_Click"  />
        </td>
    </tr>
    <tr>
        <td class="auto-style3">Nombre del producto:
            <asp:TextBox ID="txtNombreProducto"  runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Precio por Unidad/compra:
            <asp:TextBox ID="txtUnidadCompra"  runat="server"></asp:TextBox>
        </td>
        <td>Precio por Unidad/venta:<asp:TextBox ID="txtUnidadVenta"  runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;&nbsp;</td>
        <td class="auto-style2">
            &nbsp;
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;&nbsp;
            </td>
        <td>
            &nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">* Ingresos, egresos, estado y stock se actualizan automaticamente en el sistema</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <br />
            <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"  />
            <br />
&nbsp;&nbsp;
            </td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Reporte" />
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        Buscar por:&nbsp;
        <asp:DropDownList ID="cboBusqueda" runat="server">
            <asp:ListItem Value="IdSala">Codigo Sala</asp:ListItem>
            <asp:ListItem Value="IdProducto">Codigo Producto</asp:ListItem>
            <asp:ListItem Value="NombreProducto">Nombre</asp:ListItem>
        </asp:DropDownList>
&nbsp;
        <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="btnBuscar" runat="server"  Text="Buscar" OnClick="btnBuscar_Click" />
&nbsp;&nbsp;
        <asp:Button ID="btnListar" runat="server"  Text="Ver todos" OnClick="btnListar_Click" />
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:GridView ID="GridViewProductosBodega" runat="server" AllowPaging="True" BackColor="White" BorderColor="#016D82" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal"  PageSize="5" OnPageIndexChanging="GridViewProductosBodega_PageIndexChanging">
        <FooterStyle BackColor="White" ForeColor="#016D82" />
        <HeaderStyle BackColor="#016D82" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#016D82" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#4A9BB2" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p>
    </p>
    <p>
        <asp:Label ID="lblError" runat="server" Font-Names="Open Sans" Font-Size="X-Large" Text="Label" Visible="False"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
