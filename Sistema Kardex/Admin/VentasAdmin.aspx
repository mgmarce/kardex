<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="VentasAdmin.aspx.cs" Inherits="Sistema_Kardex.Admin.VentasAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <h1>Ventas</h1>
    <p>&nbsp;</p>
    <p>&nbsp; &nbsp;<asp:Button ID="btnReporte" runat="server" Text="Reporte" OnClick="btnReporte_Click" />
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        Buscar por:
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="tipoDocumento">Tipo Documento</asp:ListItem>
            <asp:ListItem Value="nombre_producto">Producto</asp:ListItem>
            <asp:ListItem Value="IdDetalleVenta">ID</asp:ListItem>
        </asp:DropDownList>
        &nbsp;<asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>
        &nbsp;&nbsp;<asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click1" Text="Buscar" />
        &nbsp;&nbsp;
        <asp:Button ID="VerTodos" runat="server" OnClick="VerTodos_Click" Text="Ver Todos" />
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#016D82" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Height="566px" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" Width="1306px">
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p style="height: 109px">
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Names="open sans" Font-Size="X-Large" Visible="False"></asp:Label>
</p>
</asp:Content>
