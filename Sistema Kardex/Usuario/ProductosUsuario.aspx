<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/MenuUsuario.Master" AutoEventWireup="true" CodeBehind="ProductosUsuario.aspx.cs" Inherits="Sistema_Kardex.Usuario.ProductosUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 1192px;
        }
        .auto-style3 {
            width: 479px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
             <h1>Productos</h1>
    <table class="auto-style2">
    <tr>
        <td class="auto-style3">&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Codigo del Producto:"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtCodigo" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Nombre del Producto:
            <asp:TextBox ID="txtProducto" runat="server" ReadOnly="True" ></asp:TextBox>
        </td>
        <td>&nbsp;Proveedor:&nbsp;&nbsp;
            <asp:TextBox ID="txtProveedor" type="number" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Codigo de Familia:
            <asp:TextBox ID="txtFamilia" type="number"  runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td class="auto-style5">
            &nbsp; Codigo de Grupo:
            <asp:TextBox ID="txtGrupo" type="number" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;&nbsp;&nbsp; Codigo de Subgrupo:
            <asp:TextBox ID="txtSubGrupo"  type="number" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <br />
&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
            <br />
&nbsp;&nbsp;
            </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        &nbsp;</p>
    <p>
    Buscar por:&nbsp;
    <asp:DropDownList ID="cboBusqueda" runat="server">
        <asp:ListItem Value="IdProducto">Codigo</asp:ListItem>
        <asp:ListItem Value="NombreProducto">Nombre</asp:ListItem>
        <asp:ListItem Value="IdCategoriaFamiliar">Codigo Familia</asp:ListItem>
        <asp:ListItem Value="IdCategoriaGrupo">Codigo Grupo</asp:ListItem>
        <asp:ListItem Value="IdCategoriaSubGrupo">Codigo Subgrupo</asp:ListItem>
    </asp:DropDownList>
&nbsp; <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
&nbsp;&nbsp; <asp:Button ID="btnBuscar" runat="server" Text="Buscar"  />
            &nbsp;&nbsp; <asp:Button ID="btnListar" runat="server" Text="Ver todos"   />
            </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:GridView ID="GridViewProductos" runat="server" BackColor="White" BorderColor="#016D82" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewProductos_PageIndexChanging" OnSelectedIndexChanged="GridViewProductos_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="Ver detalles">
            <ControlStyle BackColor="#016D82" ForeColor="White" />
            </asp:CommandField>
        </Columns>
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
        &nbsp;</p>
    <p>
        <asp:Label ID="lblError" runat="server" Font-Names="Open Sans" Font-Size="X-Large" Text="Label" Visible="False"></asp:Label>
        </p>
    <p>
        &nbsp;</p>
</asp:Content>
