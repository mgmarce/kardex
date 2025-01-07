<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="ReporteProductos.aspx.cs" Inherits="Sistema_Kardex.Admin.ReporteProductos" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Ir Atras" OnClick="Button2_Click" />
    </p>
    <p>
        Reporte de Productos por fecha</p>
    <p>
        Reporte desde:
        <asp:TextBox ID="TextBox1" placeholder="AAAA-MM-DD" runat="server"></asp:TextBox>
&nbsp;hasta:
        <asp:TextBox ID="TextBox2" placeholder="AAAA-MM-DD" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Generar" OnClick="Button1_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="528px" Visible="False" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1035px">
        <LocalReport ReportPath="Admin\ReporteProductos.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
