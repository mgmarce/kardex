<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="ReporteBodega.aspx.cs" Inherits="Sistema_Kardex.Admin.ReproteBodega" %><%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Ir Atras" />
    </p>
    <p>
        Reporte de Productos en Bodega</p>
    <p>
        Reporte de productos:
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value=" En Existencia">En Existencia</asp:ListItem>
            <asp:ListItem>Agotado</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generar" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Visible="False" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1031px">
        <LocalReport ReportPath="Admin\ReporteBodega.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
