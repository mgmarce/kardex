<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Sistema_Kardex.Admin.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 417px;
        }
        .auto-style4 {
            width: 417px;
            height: 55px;
        }
        .auto-style5 {
            height: 55px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3">
                <br />
                <br />
                <br />
                <br />
                <br />
                Nombres:
                <asp:TextBox ID="TextBox2" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <br />
                <br />
                <br />
                <br />
                <br />
                Apellidos:
                <asp:TextBox ID="TextBox3" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <br />
                Correo:
                <asp:TextBox ID="TextBox4" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <br />
                <br />
                Usuario:
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
&nbsp; Clave:
                <asp:TextBox ID="TextBox6" runat="server" type="password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Tipo de usario:
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Value="Administrador">Administrador</asp:ListItem>
                    <asp:ListItem Value="Usuario">Usuario</asp:ListItem>
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox11" runat="server" Width="44px"></asp:TextBox>
            </td>
            <td>Estado:
                <asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem Value="Estado">Activo</asp:ListItem>
                    <asp:ListItem Value="Estado">Inactivo</asp:ListItem>
                </asp:DropDownList>
&nbsp; Numero de sala:
                <asp:TextBox ID="TextBox10" Type="number" runat="server" Width="45px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Button ID="Button1" runat="server" Text="Ingresar" OnClick="Button1_Click" />
&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Editar" OnClick="Button2_Click" />
&nbsp;
                <asp:Button ID="Button5" runat="server" Text="Cancelar" OnClick="Button5_Click" />
            </td>
            <td>
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Reporte" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        Buscar por:
        <asp:DropDownList ID="DropDownList1" runat="server" Width="200px">
            <asp:ListItem Value="Nombres">Nombres</asp:ListItem>
            <asp:ListItem>Apellidos</asp:ListItem>
            <asp:ListItem>Usuario</asp:ListItem>
            <asp:ListItem Value="IdSala">Sala</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="216px"></asp:TextBox>
&nbsp;<asp:Button ID="Button3" runat="server" Text="Buscar" OnClick="Button3_Click" />
&nbsp;
        <asp:Button ID="Button4" runat="server" Text="Ver todos" OnClick="Button4_Click" />
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="5" Width="1002px" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True">
                <ControlStyle BackColor="#016D82" ForeColor="White" />
                </asp:CommandField>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                <ControlStyle BackColor="#FF6F60" ForeColor="White" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#016D82" />
            <HeaderStyle BackColor="#016D82" ForeColor="White" />
            <PagerStyle BackColor="#016D82" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#4A9BB2" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p>
        <br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
    </p>
</asp:Content>
