<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="CategoriaSubGrupo.aspx.cs" Inherits="Sistema_Kardex.Admin.CategoriaSubGrupo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 100%;
    }
    .auto-style3 {
        width: 368px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <h1>Categoria Sub Grupo</h1>
</p>
    <p>
        <asp:Label ID="lblNuevo" runat="server" Text="Ingresa el nombre de la nueva categoria que quiere registrar"></asp:Label>
    </p>
<table class="auto-style2">
    <tr>
        <td class="auto-style3">&nbsp; Nombre de la categoria:<asp:TextBox ID="txtNombre" runat="server" ></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="lblIdG" runat="server" Text="Id del Grupo:"></asp:Label>
            <asp:TextBox ID="txtIdG" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;
            <asp:Label ID="lblId" runat="server" Text="Id de la categoria:"></asp:Label>
            <asp:TextBox ID="txtId" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="lblFecha" runat="server" Text="Fecha de registro:"></asp:Label>
            <asp:TextBox ID="txtFecha" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <br />
            <br />
            <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnEditar" runat="server" Text="Editar"  Visible="False" OnClick="btnEditar_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"  />
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
    Buscar por:
    <asp:DropDownList ID="ListaBusqueda" runat="server">
        <asp:ListItem Value="IdCategoriaSubGrupo">Codigo</asp:ListItem>
        <asp:ListItem Value="IdCategoriaGrupo">Codigo Grupo</asp:ListItem>
        <asp:ListItem Value="categoria_sudgrupo">Nombre</asp:ListItem>
        <asp:ListItem Value="FechaRegistro">Fecha</asp:ListItem>
    </asp:DropDownList>
&nbsp;<asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
&nbsp;&nbsp;<asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"  />
            &nbsp; <asp:Button ID="btnListar" runat="server" Text="Ver todos" OnClick="btnListar_Click" />
            </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:GridView ID="GridViewSubGrupo" runat="server" BackColor="White" BorderColor="#016D82" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" OnPageIndexChanging="GridViewSubGrupo_PageIndexChanging" PageSize="6" OnSelectedIndexChanged="SelectIndexSubGrupo_SelectedIndexChanged" OnRowDeleting="GridViewSubGrupo_RowDeleting">
    <Columns>
        <asp:CommandField ButtonType="Button" ShowSelectButton="True">
        <ControlStyle BackColor="#016D82" ForeColor="White" />
        </asp:CommandField>
        
        

        <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
        <ControlStyle BackColor="#FF6F60" ForeColor="White" />
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
        <asp:Label ID="lblInformacion" runat="server" Font-Names="Open Sans" Font-Size="X-Large" Visible="False"></asp:Label>
        <br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

    </p>
</asp:Content>