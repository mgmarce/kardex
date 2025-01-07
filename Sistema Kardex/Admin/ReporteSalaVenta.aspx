<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrador.Master" AutoEventWireup="true" CodeBehind="ReporteSalaVenta.aspx.cs" Inherits="Sistema_Kardex.Admin.ReporteSalaVenta" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btnRegresar" runat="server" PostBackUrl="~/Admin/SalaDeVentas.aspx" Text="Ir atrás" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        Ingrese la dirección que quiere buscar</p>
    <p>
        <br />
        <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Generar" Width="63px" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <p>
    </p>
    <rsweb:ReportViewer ID="ReporteSalaVentas" runat="server" Visible="False" Width="832px">
    </rsweb:ReportViewer>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
