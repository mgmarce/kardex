<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="ReporteKardexFamiliar.aspx.cs" Inherits="Sistema_Kardex.Admin.ReporteKardexFamiliar" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Button ID="Button2" runat="server" PostBackUrl="~/Admin/KardexFamilia.aspx" Text="Ir atrás" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        Ingrese el nombre de la categoría:</p>
    <p>
        <br />
        <asp:TextBox ID="txtCategoria" runat="server"></asp:TextBox>
        <asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Generar" Width="63px" />
    </p>
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <p>
        &nbsp;</p>
    <rsweb:ReportViewer ID="ReportKardexFamiliar" runat="server" Visible="False" Width="793px">
    </rsweb:ReportViewer>
    <p>
        &nbsp;</p>
    <p>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
