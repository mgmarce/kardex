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
    public partial class CategoriaFamilia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {

                LlenarGrid();
                lblId.Visible = false;
                txtId.Visible = false;
                lblFecha.Visible = false;
                txtFecha.Visible = false;

            }
        }

        //conexion
        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
        //SqlConnection con = new SqlConnection("Data Source=LAPTOP-O17HLAGC\\SQLExpress;Initial Catalog=DBPROYECTO;Integrated Security=True");
        
        void LlenarGrid()
        {
            SqlCommand co = new SqlCommand("listar_CategoriaFamiliar", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewFamilia.DataSource = dt;
            GridViewFamilia.DataBind();
            txtNombre.Text = "";
            lblInformacion.Visible = false;
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNombre.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Por favor llene los campos.');", true);
                
            }
            else
            {
                SqlCommand co1 = new SqlCommand("select * from CATEGORIA_FAMILIAR where categoria_familia = '" + txtNombre.Text + "'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co1);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewFamilia.DataSource = dt;
                GridViewFamilia.DataBind();

                if (dt.Rows.Count == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Ya exite un registro con ese codigo, ingrese otro.');", true);
                }
                else
                {
                    string NomFamiliar = txtNombre.Text;

                    con.Open();
                    SqlCommand co = new SqlCommand("exec agregar_categoriaFamiliar '" + NomFamiliar + "'", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGrid();
                    VaciarCampos();
                    lblInformacion.Visible = false;
                }

            }

            GridViewFamilia.SelectedIndex = -1;

        }
        
        protected void GridViewFamilia_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewFamilia.PageIndex = e.NewPageIndex;
            LlenarGrid();
            GridViewFamilia.SelectedIndex = -1;
        }

        public void VaciarCampos()
        {
            txtId.Text = "";
            txtNombre.Text = "";
            txtFecha.Text = "";
            txtNombre.Focus();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblFecha.Visible = false;
            lblId.Visible = false;
            txtFecha.Visible = false;
            txtId.Visible = false;
            VaciarCampos();
            btnInsertar.Visible = true;
            btnEditar.Visible = false;
            lblInformacion.Visible = false;
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string categoria = txtNombre.Text;
            int id = Convert.ToInt32(txtId.Text);
            con.Open();
            SqlCommand co = new SqlCommand("exec Editar_categoriaFamiliar '" + id + "','" + categoria + "'", con);
            co.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Actualizado correctamente.');", true);
            btnInsertar.Visible = true;
            btnEditar.Visible = false;
            LlenarGrid();
            VaciarCampos();
        
            GridViewFamilia.SelectedIndex = -1;

            lblId.Visible = false;
            lblFecha.Visible = false;
            txtId.Visible = false;
            txtFecha.Visible = false;
            lblInformacion.Visible = false;

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBusqueda.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir algo para buscar.');", true);
            }
            else
            {
                SqlCommand co = new SqlCommand("select IdCategoriaFamiliar as 'ID', categoria_familia as 'Nombre de la categoria', FechaRegistro as 'Fecha de registro' from CATEGORIA_FAMILIAR where " + ListaBusqueda.SelectedValue + " like '%" + txtBusqueda.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewFamilia.DataSource = dt;
                GridViewFamilia.DataBind();

                if (dt.Rows.Count >= 1)
                {
                    lblInformacion.Visible = false;
                }
                else
                {
                    lblInformacion.Visible = true;
                    lblInformacion.Text = "No se encontraron registros";
                }
            }
                
            GridViewFamilia.SelectedIndex = -1;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            LlenarGrid();
            VaciarCampos();
            txtFecha.Visible = false;
            txtId.Visible = false;
            lblFecha.Visible = false;
            lblId.Visible = false;
            btnEditar.Visible = false;
            btnInsertar.Visible = true;
            GridViewFamilia.SelectedIndex = -1;
            
        }
        

        protected void SelectIndexFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblId.Visible = true;
            lblFecha.Visible = true;
            txtFecha.Visible = true;
            txtId.Visible = true;
            txtId.Text = GridViewFamilia.SelectedRow.Cells[1].Text;
            txtNombre.Text = GridViewFamilia.SelectedRow.Cells[2].Text;
            txtFecha.Text = GridViewFamilia.SelectedRow.Cells[3].Text;
            btnInsertar.Visible = false;
            btnEditar.Visible = true;
            lblNuevo.Visible = false;
            lblInformacion.Visible = false;
        }

        protected void GridViewFamilia_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int cod = Convert.ToInt32(GridViewFamilia.Rows[i].Cells[2].Text);
            SqlCommand val = new SqlCommand("exec ValidacionFamilia_Producto '" + cod + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(val);
            DataTable dt = new DataTable();
            sd.Fill(dt);

            SqlCommand val2 = new SqlCommand("exec ValidacionFamilia_Grupo '" + cod + "'", con);
            SqlDataAdapter sd2 = new SqlDataAdapter(val2);
            DataTable dt2 = new DataTable();
            sd2.Fill(dt2);

            if (dt.Rows.Count == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se puede eliminar la categoria familia, por que hay productos relacionados con ella.');", true);

            }

            else if (dt2.Rows.Count == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se puede eliminar la categoria familia, por que hay Grupos relacionados con ella.');", true);

            }
            else
            {
                con.Open();
                SqlCommand co = new SqlCommand("exec EliminarFamilias '" + cod + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Eliminado correctamente.');", true);
                LlenarGrid();
            }
        }
    }
}