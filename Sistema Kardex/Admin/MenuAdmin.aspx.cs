using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Kardex.Admin
{
    public partial class MenuAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string nombre = Session["nombre"].ToString();
            string apellido = Session["apellido"].ToString();
            string tipo = Session["tipouser"].ToString();
            Label3.Text = nombre;
            Label4.Text = "( " + tipo + ")";
            productos();
            proveedores();
            salas();
            Usuarios();

        }

        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");


        public void productos()
        {
            SqlCommand co = new SqlCommand("select count (IdProducto) from PRODUCTO", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            Label6.Text = dt.Rows[0][0].ToString();
        }

        public void proveedores()
        {
            SqlCommand co = new SqlCommand("select count (IdProveedor) from PROVEEDOR", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            Label1.Text = dt.Rows[0][0].ToString();
        }
        public void Usuarios()
        {
            SqlCommand co = new SqlCommand("select count (IdUsuario) from USUARIO", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            Label2.Text = dt.Rows[0][0].ToString();
        }
        public void salas()
        {
            SqlCommand co = new SqlCommand("select count (IdSala) from SALA_VENTA", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            Label5.Text = dt.Rows[0][0].ToString();
        }
    }
}