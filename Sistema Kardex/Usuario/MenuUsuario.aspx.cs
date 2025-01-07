using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Kardex.Usuario
{
    public partial class MenuUsuario1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string nombre = Session["nombre"].ToString();
            string apellido = Session["apellido"].ToString();
            string tipo = Session["tipouser"].ToString();
            Label3.Text = nombre;
            Label4.Text = "( " + tipo + ")";
            Label5.Text = nombre;
        }
    }
}