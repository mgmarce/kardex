<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sistema_Kardex.Publico.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body{
            
            background:#016D82;
        }
        h1{
            color:#016D82;
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            margin-top:-10px;
        }
    

        .login{
            margin-top:5rem;
            margin-left:35%;
            margin-right:10%;
            width: 300px;
            height: 320px;
            padding: 50px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, .3); 
        }
        
        input[type="submit"]{
 
       cursor:pointer;
       border-radius:5px;

}

      
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <h1>Sistema Web Kardex</h1>
            <asp:Label ID="Label3" runat="server" Text="Usuario" Font-Names="Segoe UI" Font-Size="12pt"></asp:Label>
            <br />
            <asp:TextBox ID="txtUsuario" runat="server" Height="30px" Width="283px" BorderColor="#015D6E" AutoCompleteType="Disabled" Font-Names="Segoe UI" Font-Size="Large"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Contraseña" Font-Names="Segoe UI" Font-Size="12pt"></asp:Label>
            <br />
            <asp:TextBox ID="txtPass" runat="server" Height="30px" Width="285px" BorderColor="#016073" AutoCompleteType="Disabled" Font-Bold="True" Font-Size="Large" TextMode="Password" ></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Iniciar Sesion" BackColor="#016D82" BorderColor="#016D82" ForeColor="White" Height="35px" Width="291px" BorderStyle="None" Font-Names="Segoe UI" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:Button ID="Button2" runat="server" BackColor="#E53935" BorderColor="#e53935" BorderStyle="None" ForeColor="White" Height="35px" Text="Cancelar" Width="292px" Font-Names="Segoe UI" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" EnableTheming="True" Font-Bold="False" Font-Size="X-Large" Font-Underline="False" ForeColor="#016D82" NavigateUrl="~/Publico/Index.aspx">Ir atras</asp:HyperLink>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
       
    </form>
</body>
</html>
