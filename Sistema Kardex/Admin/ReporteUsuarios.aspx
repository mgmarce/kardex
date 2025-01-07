<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="ReporteUsuarios.aspx.cs" Inherits="Sistema_Kardex.Admin.ReporteUsuarios" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            margin-bottom: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Ir Atras" />
    <br />
</p>
<p>
    Reporte de Usuarios</p>
<p>
    Tipo de usuario:
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>Administrador</asp:ListItem>
        <asp:ListItem>Usuario</asp:ListItem>
    </asp:DropDownList>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Generar" OnClick="Button1_Click" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</p>
<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" CssClass="auto-style2" Visible="False" Width="1004px">
    <LocalReport ReportPath="Admin\ReporteUsuarios.rdlc">
    </LocalReport>
</rsweb:ReportViewer>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>

