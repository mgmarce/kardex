<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="ReportVentas.aspx.cs" Inherits="Sistema_Kardex.Admin.ReportVentas" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Button ID="btnAtras" runat="server" OnClick="btnAtras_Click" Text="Ir atras" />
        <br />
    </p>
    <p>
        Desde:
        <asp:TextBox ID="TextBox1" placeholder="AAAA-MM-DD" runat="server"></asp:TextBox>
&nbsp;&nbsp; Hasta:
        <asp:TextBox ID="TextBox2" placeholder="AAAA-MM-DD" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="btnGenerar" runat="server" OnClick="btnGenerar_Click" Text="Generar" />
    </p>
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="544px" Visible="False" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1296px">
        <LocalReport ReportPath="Admin\ReporteVentas.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
