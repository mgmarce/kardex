<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="ReporteKardexGrupo.aspx.cs" Inherits="Sistema_Kardex.Admin.ReporteKardexGrupo" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <asp:Button ID="btnIrAtras" runat="server" PostBackUrl="~/Admin/KardexGrupo.aspx" Text="Ir atrás" />
    </p>
    <p>
        Ingrese el nombre de la categoría:</p>
    <p>
        <br />
        &nbsp;
        <asp:TextBox ID="txtCategoria" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Generar" Width="63px" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <p>
    </p>
    <rsweb:ReportViewer ID="ReporteKardexGrup" runat="server" Visible="False" Width="825px">
    </rsweb:ReportViewer>
    <p>
        &nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
