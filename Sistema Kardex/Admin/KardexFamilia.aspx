<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="KardexFamilia.aspx.cs" Inherits="Sistema_Kardex.Admin.KardexFamilia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 100%;
    }
    .auto-style3 {
            width: 450px;
        }
        .auto-style4 {
            width: 450px;
            height: 35px;
        }
        .auto-style5 {
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <p>
    <h1>Kardex de Categoria Familia</h1>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<table class="auto-style2">
    <tr>
        <td class="auto-style3">&nbsp;&nbsp;
            <asp:Label ID="lblNom" runat="server" Visible="False">Nombre de la categoria:</asp:Label>
&nbsp;<asp:TextBox ID="txtNom" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="lblMax" runat="server" Visible="False">Maximo categoria</asp:Label>
&nbsp;<asp:TextBox ID="txtMax" runat="server" ReadOnly="True" Visible="False" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMetodo" runat="server" Visible="False">Metodo kardex: </asp:Label>
            <asp:TextBox ID="txtMetodo" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
            <br />
        </td>
        <td class="auto-style5">
            <asp:Label ID="lblMin" runat="server" Visible="False">Minimo categoria</asp:Label>
&nbsp; <asp:TextBox ID="txtMin" runat="server" ReadOnly="True" Visible="False" Width="47px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    
</table>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        Generar Kardex de Categoria:
    &nbsp;<asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
&nbsp;&nbsp;<asp:Button ID="btnBuscar" runat="server" Text="Generar" OnClick="btnBuscar_Click" />
            &nbsp; 
            <asp:Button ID="btnVerCategorias" runat="server" Text="Ver categorias" OnClick="btnVerCategorias_Click" />
            &nbsp;&nbsp;
        <asp:Button ID="btnGenerar" runat="server" Text="Generar Reporte" Width="106px" OnClick="btnGenerar_Click" Visible="False" />
            </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">



</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridViewKardexFamilia" runat="server" BackColor="White" BorderColor="#016D82" BorderStyle="Double" BorderWidth="3px" CellPadding="10" GridLines="Horizontal" Height="150px" Width="600px" ItemType="item" Visible="False" >
    
    <FooterStyle BackColor="White" ForeColor="#016D82" />
    <HeaderStyle BackColor="#016D82" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
    <PagerStyle BackColor="#016D82" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Left" VerticalAlign="Middle" />
    <SelectedRowStyle BackColor="#4A9BB2" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />

</asp:GridView>
        <asp:GridView ID="GridViewFamilia" runat="server" BackColor="White" BorderColor="#016D82" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" OnPageIndexChanging="GridViewFamilia_PageIndexChanging" PageSize="6" OnSelectedIndexChanged="SelectIndexFamilia_SelectedIndexChanged">
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
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="lblInformacion" runat="server"></asp:Label>
    </p>
</asp:Content>
