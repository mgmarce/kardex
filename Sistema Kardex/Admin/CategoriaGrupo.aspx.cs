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
    public partial class CategoriaGrupo : System.Web.UI.Page
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
        //SqlConnection con = new SqlConnection("Data Source=HELHEIM-PC\\SAMUEL;Initial Catalog=DBPROYECTO;Integrated Security=True");
        
        void LlenarGrid()
        {
            SqlCommand co = new SqlCommand("listar_CategoriaGrupo", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewGrupo.DataSource = dt;
            GridViewGrupo.DataBind();
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
                SqlCommand co1 = new SqlCommand("select * from CATEGORIA_GRUPO where categoria_grupo = '" + txtNombre.Text + "'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co1);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewGrupo.DataSource = dt;
                GridViewGrupo.DataBind();

                if (dt.Rows.Count == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Ya exite un registro con ese codigo, ingrese otro.');", true);
                }
                else
                {
                    string NomGrupo = txtNombre.Text;
                    int IdF = Convert.ToInt32(txtIdF.Text);

                    con.Open();
                    SqlCommand co = new SqlCommand("exec agregar_categoriagrupo '" + NomGrupo + "','"+ IdF + "'", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGrid();
                    VaciarCampos();
                    lblInformacion.Visible = false;
                }

            }

            GridViewGrupo.SelectedIndex = -1;

        }
        
        protected void GridViewGrupo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           GridViewGrupo.PageIndex = e.NewPageIndex;
            LlenarGrid();
            GridViewGrupo.SelectedIndex = -1;
        }

        public void VaciarCampos()
        {
            txtId.Text = "";
            txtIdF.Text = "";
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
            int idF = Convert.ToInt32(txtIdF.Text);
            con.Open();
            SqlCommand co = new SqlCommand("exec Editar_categoriaGrupo '" + id + "','" +idF+"','"+ categoria + "'", con);
            co.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Actualizado correctamente.');", true);
            btnInsertar.Visible = true;
            btnEditar.Visible = false;
            LlenarGrid();
            VaciarCampos();
        
            GridViewGrupo.SelectedIndex = -1;

            lblId.Visible = false;
            lblIdF.Visible = false;
            lblFecha.Visible = false;
            txtId.Visible = false;
            txtIdF.Visible = false;
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
                SqlCommand co = new SqlCommand("select IdCategoriaGrupo as 'ID', IdCategoriaFamiliar as 'ID Familiar', categoria_grupo as 'Nombre de la categoria', FechaRegistro as 'Fecha de registro' from CATEGORIA_GRUPO where " + ListaBusqueda.SelectedValue + " like '%" + txtBusqueda.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewGrupo.DataSource = dt;
                GridViewGrupo.DataBind();

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
                
            GridViewGrupo.SelectedIndex = -1;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            LlenarGrid();
            txtBusqueda.Text = "";
            GridViewGrupo.SelectedIndex = -1;
            
        }
        

        protected void SelectIndexGrupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblId.Visible = true;
            lblIdF.Visible = true;
            lblFecha.Visible = true;
            txtFecha.Visible = true;
            txtId.Visible = true;
            txtIdF.Visible = true;
            txtId.Text = GridViewGrupo.SelectedRow.Cells[1].Text;
            txtIdF.Text = GridViewGrupo.SelectedRow.Cells[2].Text;
            txtNombre.Text = GridViewGrupo.SelectedRow.Cells[3].Text;
            txtFecha.Text = GridViewGrupo.SelectedRow.Cells[4].Text;
            btnInsertar.Visible = false;
            btnEditar.Visible = true;
            lblNuevo.Visible = false;
            lblInformacion.Visible = false;
        }

        protected void GridViewGrupo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int cod = Convert.ToInt32(GridViewGrupo.Rows[i].Cells[2].Text);

            SqlCommand val = new SqlCommand("exec ValidacionCatGrupo_Producto '" + cod + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(val);
            DataTable dt = new DataTable();
            sd.Fill(dt);


            SqlCommand val2 = new SqlCommand("exec ValidacionCatGrupo_CatSubgrupo '" + cod + "'", con);
            SqlDataAdapter sd2 = new SqlDataAdapter(val2);
            DataTable dt2 = new DataTable();
            sd2.Fill(dt2);

            if (dt.Rows.Count == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se puede eliminar la categoria grupo, por que hay productos relacionados con ella.');", true);
            }


            else if (dt2.Rows.Count == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se puede eliminar la categoria grupo, por que hay SubGrupos relacionados con ella.');", true);

            }

            else
            {
                con.Open();
                SqlCommand co = new SqlCommand("exec EliminarGrupo '" + cod + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Eliminado correctamente.');", true);
                LlenarGrid();
            }
        }
    }
}