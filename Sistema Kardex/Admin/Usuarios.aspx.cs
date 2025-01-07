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
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
            TextBox11.Visible = false;
            if (!Page.IsPostBack)
            {

                LlenarGrid();

            }
        }
        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");


        void LlenarGrid()
        {
            SqlCommand co = new SqlCommand("ListarUsuarios", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox3.Text) ||
                string.IsNullOrEmpty(TextBox4.Text) || string.IsNullOrEmpty(TextBox5.Text) ||
                string.IsNullOrEmpty(TextBox6.Text) || string.IsNullOrEmpty(TextBox10.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Por favor llene los campos.');", true);
            }
            
                else
                {
                    string nombre = TextBox2.Text, apellido = TextBox3.Text, correo = TextBox4.Text, usuario = TextBox5.Text;
                    string clave = TextBox6.Text, tipo = DropDownList2.SelectedValue, estado = DropDownList3.SelectedValue;
                    int sala = Convert.ToInt32(TextBox10.Text);
                    con.Open();
                    SqlCommand co = new SqlCommand("exec InsertarUsuarios '" + nombre + "','" + apellido + "','" + correo + "','" + usuario + "','" + clave + "','" + sala + "','" + tipo + "','" + estado + "'", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGrid();
                    VaciarCampos();
                }
            

            GridView1.SelectedIndex = -1;
        }

        public void VaciarCampos()
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            
            
            //Enfoco en el primer TextBox
            TextBox10.Focus();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir algo para buscar.');", true);
            }
            else
            {
                SqlCommand co = new SqlCommand("select Nombres as 'NOMBRES', Apellidos as 'APELLIDOS', Usuario as 'USUARIO', IdSala as 'NUMERO DE SALA' from USUARIO where " + DropDownList1.SelectedValue + " like '%" + TextBox1.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (dt.Rows.Count >= 1)
                {
                    Label3.Visible = false;
                }
                else
                {
                    Label3.Visible = true;
                    Label3.Text = "No se encontraron registros";
                }
            }

            GridView1.SelectedIndex = -1;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int i = e.RowIndex;
            int cod = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
            con.Open();
            SqlCommand co = new SqlCommand("exec EliminarUsuarios '" + cod + "'", con);
            co.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Eliminado correctamente.');", true);
            LlenarGrid();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox11.Text = GridView1.SelectedRow.Cells[2].Text;
            TextBox2.Text = GridView1.SelectedRow.Cells[3].Text;
            TextBox3.Text = GridView1.SelectedRow.Cells[4].Text;
            TextBox4.Text = GridView1.SelectedRow.Cells[5].Text;
            TextBox5.Text = GridView1.SelectedRow.Cells[6].Text;
            TextBox6.Text = GridView1.SelectedRow.Cells[7].Text;
            TextBox10.Text = GridView1.SelectedRow.Cells[8].Text;

            Button1.Visible = false;
            Button2.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox3.Text) ||
                string.IsNullOrEmpty(TextBox4.Text) || string.IsNullOrEmpty(TextBox5.Text) ||
                string.IsNullOrEmpty(TextBox6.Text) || string.IsNullOrEmpty(TextBox10.Text))
            {
                //si alguno esta vacio le mando un mensaje

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Por favor llene los campos.');", true);


            }

            else
            {
                string nombre = TextBox2.Text, apellido = TextBox3.Text, correo = TextBox4.Text, usuario = TextBox5.Text;
                string clave = TextBox6.Text, tipo = DropDownList2.SelectedValue, estado = DropDownList3.SelectedValue;
                int sala = Convert.ToInt32(TextBox10.Text), cod = Convert.ToInt32(TextBox11.Text); ;
                con.Open();
                SqlCommand co = new SqlCommand("exec ActualizarUsuarios '" + cod + "','" + nombre + "','" + apellido + "','" + correo + "','" + usuario + "','" + clave + "','" + sala + "','" + tipo + "','" + estado + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Actualizado correctamente.');", true);
                Button1.Visible = true;
                Button2.Visible = false;
                LlenarGrid();
                VaciarCampos();
            }
            GridView1.SelectedIndex = -1;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            LlenarGrid();
            TextBox6.Text = "";
            Label3.Visible = false;
            GridView1.SelectedIndex = -1;
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            //GridView1.PageIndex = e.NewPageIndex;
            LlenarGrid();
            GridView1.SelectedIndex = -1;
            TextBox11.Visible = false;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            VaciarCampos();
            Button1.Visible = true;
            Button2.Visible = false;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteUsuarios.aspx");
        }
    }
}