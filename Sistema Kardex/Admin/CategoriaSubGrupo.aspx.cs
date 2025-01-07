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
    public partial class CategoriaSubGrupo : System.Web.UI.Page
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
            SqlCommand co = new SqlCommand("listar_CategoriaSubGrupo", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewSubGrupo.DataSource = dt;
            GridViewSubGrupo.DataBind();
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
                SqlCommand co1 = new SqlCommand("select * from CATEGORIA_SUBGRUPO where categoria_sudgrupo = '" + txtNombre.Text + "'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co1);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewSubGrupo.DataSource = dt;
                GridViewSubGrupo.DataBind();

                if (dt.Rows.Count == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Ya exite un registro con ese codigo, ingrese otro.');", true);
                }
                else
                {
                    string NomSubGrupo = txtNombre.Text;
                    int IdG = Convert.ToInt32(txtIdG.Text);

                    con.Open();
                    SqlCommand co = new SqlCommand("exec agregar_categoriasubgrupo '" + NomSubGrupo + "','"+ IdG + "'", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGrid();
                    VaciarCampos();
                    lblInformacion.Visible = false;
                }

            }

            GridViewSubGrupo.SelectedIndex = -1;

        }
        
        protected void GridViewSubGrupo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           GridViewSubGrupo.PageIndex = e.NewPageIndex;
            LlenarGrid();
            GridViewSubGrupo.SelectedIndex = -1;
        }

        public void VaciarCampos()
        {
            txtId.Text = "";
            txtIdG.Text = "";
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
            int idG = Convert.ToInt32(txtIdG.Text);
            con.Open();
            SqlCommand co = new SqlCommand("exec Editar_categoriaSubGrupo '" + id + "','" +idG+"','"+ categoria + "'", con);
            co.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Actualizado correctamente.');", true);
            btnInsertar.Visible = true;
            btnEditar.Visible = false;
            LlenarGrid();
            VaciarCampos();
        
            GridViewSubGrupo.SelectedIndex = -1;

            lblId.Visible = false;
            lblIdG.Visible = false;
            lblFecha.Visible = false;
            txtId.Visible = false;
            txtIdG.Visible = false;
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
                SqlCommand co = new SqlCommand("select IdCategoriaSubGrupo as 'ID', IdCategoriaGrupo as 'ID Grupo', categoria_sudgrupo as 'Nombre de la categoria', FechaRegistro as 'Fecha de registro' from CATEGORIA_SUBGRUPO where " + ListaBusqueda.SelectedValue + " like '%" + txtBusqueda.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewSubGrupo.DataSource = dt;
                GridViewSubGrupo.DataBind();

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
                
            GridViewSubGrupo.SelectedIndex = -1;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            LlenarGrid();
            txtBusqueda.Text = "";
            GridViewSubGrupo.SelectedIndex = -1;
            
        }
        

        protected void SelectIndexSubGrupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblId.Visible = true;
            lblIdG.Visible = true;
            lblFecha.Visible = true;
            txtFecha.Visible = true;
            txtId.Visible = true;
            txtIdG.Visible = true;
            txtId.Text = GridViewSubGrupo.SelectedRow.Cells[1].Text;
            txtIdG.Text = GridViewSubGrupo.SelectedRow.Cells[2].Text;
            txtNombre.Text = GridViewSubGrupo.SelectedRow.Cells[3].Text;
            txtFecha.Text = GridViewSubGrupo.SelectedRow.Cells[4].Text;
            btnInsertar.Visible = false;
            btnEditar.Visible = true;
            lblNuevo.Visible = false;
            lblInformacion.Visible = false;
        }

        protected void GridViewSubGrupo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int cod = Convert.ToInt32(GridViewSubGrupo.Rows[i].Cells[2].Text);

            SqlCommand val = new SqlCommand("exec ValidacionCatSubGrupo_Producto '" + cod + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(val);
            DataTable dt = new DataTable();
            sd.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se puede eliminar la categoria SubGrupo, por que hay productos relacionados con ella.');", true);
            }

            else
            {
                con.Open();
                SqlCommand co = new SqlCommand("exec EliminarSubGrupo '" + cod + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Eliminado correctamente.');", true);
                LlenarGrid();
            }
        }
    }
}