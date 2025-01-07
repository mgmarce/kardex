using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Kardex.Usuario
{
    public partial class MenuUsuario : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {
                if (Session["nombre"] == null)
                {
                    Response.Redirect("/Publico/Login.aspx");
                }

                else
                {
                    string nombre = Session["nombre"].ToString();
                    string apellido = Session["apellido"].ToString();
                    string tipo = Session["tipouser"].ToString();
                    Label1.Text = nombre;
                    Label2.Text = tipo;
                }
            }
        }


        public void CerrarSesion()
        {
            Session.Abandon();
            Session.Remove("nombre");
        }
    }
}