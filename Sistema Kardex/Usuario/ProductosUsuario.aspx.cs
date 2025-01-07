using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Kardex.Usuario
{
    public partial class ProductosUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {

                LlenarGridProductos();

            }
        }

        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");

        void LlenarGridProductos()
        {
            SqlCommand co = new SqlCommand("exec ListarProductos", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewProductos.DataSource = dt;
            GridViewProductos.DataBind();
        }

        protected void GridViewProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCodigo.Text = GridViewProductos.SelectedRow.Cells[1].Text;
            txtProveedor.Text = GridViewProductos.SelectedRow.Cells[2].Text;
            txtProducto.Text = GridViewProductos.SelectedRow.Cells[3].Text;
            txtFamilia.Text = GridViewProductos.SelectedRow.Cells[4].Text;
            txtGrupo.Text = GridViewProductos.SelectedRow.Cells[5].Text;
            txtSubGrupo.Text = GridViewProductos.SelectedRow.Cells[6].Text;
        }

        protected void GridViewProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewProductos.PageIndex = e.NewPageIndex;
            LlenarGridProductos();
            GridViewProductos.SelectedIndex = -1;
        }

        public void VaciarCampos()
        {
            txtCodigo.Text = "";
            txtProducto.Text = "";
            txtProveedor.Text = "";
            txtFamilia.Text = "";
            txtGrupo.Text = "";
            txtSubGrupo.Text = "";
            txtProducto.Focus();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            VaciarCampos();
        }
    }
}