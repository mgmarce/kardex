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
    public partial class KardedSubGrupo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
        //SqlConnection con = new SqlConnection("Data Source=LAPTOP-O17HLAGC\\SQLExpress;Initial Catalog=DBPROYECTO;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
            if (!Page.IsPostBack)
            {

                txtBusqueda.Text = "";
                LlenarGridSubGrupo();
            }


        }
        void LlenarGridSubGrupo()
        {
            string categoria = "subgrupo";
            btnVerCategorias.Visible = false;
            KardexNingunCampo();
            GridViewSubGrupo.Visible = true;
            GridViewKardexSubGrupo.Visible = false;
            SqlCommand co = new SqlCommand("exec seleccionar_categorias '" + categoria + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewSubGrupo.DataSource = dt;
            GridViewSubGrupo.DataBind();
            lblInformacion.Visible = false;
        }

        public void KardexCampos()
        {

            lblMin.Visible = true;
            txtMin.Visible = true;
            lblNom.Visible = true;
            txtNom.Visible = true;
            txtMetodo.Text = "Costo Promedio";
            lblMetodo.Visible = true;
            txtMetodo.Visible = true;
            txtBusqueda.Focus();
            lblMax.Visible = true;
            txtMax.Visible = true;
            GridViewKardexSubGrupo.Visible = true;
            GridViewSubGrupo.Visible = false;
            lblInformacion.Visible = false;
            btnVerCategorias.Visible = true;
        }

        public void KardexNingunCampo()
        {
            lblMin.Visible = false;
            txtMin.Visible = false;
            lblNom.Visible = false;
            txtNom.Visible = false;
            lblMetodo.Visible = false;
            txtMetodo.Visible = false;
            txtBusqueda.Focus();
            txtBusqueda.Text = "";
            lblMax.Visible = false;
            txtMax.Visible = false;
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBusqueda.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir o seleccionar alguna categoria para Generar la kardex');", true);
            }
            else
            {
                KardexCampos();

                string categoria = txtBusqueda.Text;

                SqlCommand co = new SqlCommand("exec Listar_KardexSubGrupo'" + categoria + "'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewKardexSubGrupo.DataSource = dt;
                GridViewKardexSubGrupo.DataBind();
                //ABRI LA CONEXION PORQUE LO NECESITA EL EXECUTESCALAR
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT Max(cantidad_saldos) FROM KARDEX_SUBGRUPOS where categoria_subgrupos='" + categoria + "'", con);
                txtMax.Text = cmd.ExecuteScalar().ToString();

                SqlCommand cmd1 = new SqlCommand("SELECT Min(cantidad_saldos) FROM KARDEX_SUBGRUPOS where categoria_subgrupos='" + categoria + "'", con);
                txtMin.Text = cmd1.ExecuteScalar().ToString();

                txtNom.Text = categoria.ToString();



                if (dt.Rows.Count >= 1)
                {
                    lblInformacion.Visible = false;
                    btnGenerar.Visible = true;
                }
                else
                {
                    KardexNingunCampo();
                    lblInformacion.Visible = true;
                    lblInformacion.Text = "No se encontraron registros";
                }
            }
            GridViewKardexSubGrupo.SelectedIndex = -1;

        }

        protected void SelectIndexSubGrupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtBusqueda.Text = GridViewSubGrupo.SelectedRow.Cells[2].Text;
        }
        
        protected void btnVerCategorias_Click1(object sender, EventArgs e)
        {
            KardexNingunCampo();
            string categoria = "subgrupo";
            btnVerCategorias.Visible = false;
            GridViewKardexSubGrupo.Visible = false;
            GridViewSubGrupo.Visible = true;

            SqlCommand co = new SqlCommand("exec seleccionar_categorias'" + categoria + "'", con);
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
            GridViewSubGrupo.SelectedIndex = -1;
            btnGenerar.Visible = false;

            
        }

        public void cerrarConexion()
        {
            con.Close();
        }

        protected void GridViewSubGrupo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewSubGrupo.PageIndex = e.NewPageIndex;
            LlenarGridSubGrupo();
            GridViewSubGrupo.SelectedIndex = -1;
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteKardexSubGrupo.aspx?nombre=" + txtNom.Text);
        }
    }
}