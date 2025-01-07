<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="ReporteCompras.aspx.cs" Inherits="Sistema_Kardex.Admin.ReporteCompras" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="width: 55px" Text="Atras" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <br />
        Desde:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;Hasta:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Generar" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Visible="False" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1031px">
        <LocalReport ReportPath="Admin\ReporteCompra.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
