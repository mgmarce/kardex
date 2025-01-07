<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Sistema_Kardex.Admin.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <h1>&nbsp;</h1>
<h1>Proveedores</h1>
      <table class="auto-style2">
    <tr>
        <td class="auto-style5">
            <asp:Label ID="Label3" runat="server" Text="Codigo Proveedor:" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtCod" runat="server" ReadOnly="True" Visible="False" ></asp:TextBox>
        </td>
        <td class="auto-style6">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style5">Empresa:
            <asp:TextBox ID="txtEmpresa" runat="server" ></asp:TextBox>
        </td>
        <td class="auto-style6">&nbsp;Rubro :
            <asp:TextBox ID="txtRubro" runat="server"></asp:TextBox>
        &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">Razon social:
            <asp:TextBox ID="txtRazonSocial"  runat="server"></asp:TextBox>
        </td>
        <td class="auto-style3">Telefono:<asp:TextBox ID="txtTelefono"  runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">NIT:
            <asp:TextBox ID="txtNIT"  runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;&nbsp;Direccion: <asp:TextBox ID="txtDireccion"  runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">&nbsp;&nbsp;Correo:
            <asp:TextBox ID="txtCorreo"  runat="server"></asp:TextBox>
        </td>
        <td class="auto-style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">
            <br />
            <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click"  />
&nbsp;&nbsp;&nbsp;<asp:Button ID="btnEditar" runat="server" Text="Editar" Visible="False" OnClick="btnEditar_Click" />
            &nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"  />
            <br />
&nbsp;&nbsp;
            </td>
        <td>
            <br />
            <br />
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
    <br />
</p>
<p>
    Buscar por:&nbsp;
    <asp:DropDownList ID="cboBusqueda" runat="server">
        <asp:ListItem Value="IdProveedor">Codigo Proveedor</asp:ListItem>
        <asp:ListItem Value="empresa">Nombre de la empresa</asp:ListItem>
        <asp:ListItem Value="rubro">Rubro</asp:ListItem>
    </asp:DropDownList>
&nbsp;
    <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
&nbsp;&nbsp;
    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" />
&nbsp;&nbsp;
    <asp:Button ID="btnListar" runat="server" OnClick="btnListar_Click" Text="Ver todos" />
</p>
<p>
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:GridView ID="GridViewProveedores" runat="server" AllowPaging="True" BackColor="White" BorderColor="#016D82" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal"  PageSize="5" OnPageIndexChanging="GridViewProveedores_PageIndexChanging" OnSelectedIndexChanged="GridViewProveedores_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True">
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
