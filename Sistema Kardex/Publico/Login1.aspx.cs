using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Kardex.Publico
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if ((string)Session["nombre"] != null)
                    Session.Remove("nombre");
            }
           

        }

        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string usuario, contra;
            usuario = TextBox1.Text;
            contra = TextBox2.Text;
            con.Open();
            SqlCommand co = new SqlCommand("PaLogin '" + usuario + "','" + contra + "'", con);
            co.ExecuteNonQuery();
            con.Close();
            SqlDataAdapter sda = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sda.Fill(dt);


            if (dt.Rows.Count == 1)
            {
                Session["nombre"] = dt.Rows[0][0].ToString();
                Session["apellido"] = dt.Rows[0][1].ToString();
                Session["tipouser"] = dt.Rows[0][2].ToString();

                if (dt.Rows[0][2].ToString() == "Administrador")
                {
                   
                   
                    Response.Redirect("/Admin/MenuAdmin.aspx");
                }
                else if (dt.Rows[0][2].ToString() == "Usuario")
                {


                    Response.Redirect("/Usuario/MenuUsuario.aspx");


                }
                

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No existe.');", true);

            }
        }

       
    }
}