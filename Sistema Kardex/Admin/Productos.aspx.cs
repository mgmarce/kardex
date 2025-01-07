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
    public partial class Productos : System.Web.UI.Page
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

        protected void btnInsertar_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtProducto.Text) || string.IsNullOrEmpty(txtFamilia.Text) || string.IsNullOrEmpty(txtGrupo.Text)
                || string.IsNullOrEmpty(txtSubGrupo.Text) || string.IsNullOrEmpty(txtProveedor.Text))
            {


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Por favor llene los campos.');", true);


            }

            else
            {
                string nombre = txtProducto.Text;
                int proveedor = Convert.ToInt32(txtProveedor.Text), familia = Convert.ToInt32(txtFamilia.Text),
                grupo = Convert.ToInt32(txtGrupo.Text), subgrupo = Convert.ToInt32(txtSubGrupo.Text);
                    con.Open();
                    SqlCommand co = new SqlCommand("exec InsertarProductos '" + proveedor + "','" + nombre + "','" + familia + "','" + grupo + "','" + subgrupo + "'", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGridProductos();
                    VaciarCampos();
                }

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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBusqueda.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir algo para buscar.');", true);
            }
            else
            {
                SqlCommand co = new SqlCommand("select IdProducto as 'Codigo', proveedor as 'Codigo Proveedor',NombreProducto as 'Nombre',IdCategoriaFamiliar as 'Codigo Familia', IdCategoriaGrupo as 'Codigo Grupo', IdCategoriaSubGrupo as 'Codigo Subgrupo', FechaRegistro as 'Fecha de registro' from PRODUCTO where " + cboBusqueda.SelectedValue + " like '%" + txtBusqueda.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewProductos.DataSource = dt;
                GridViewProductos.DataBind();

                if (dt.Rows.Count >= 1)
                {
                    lblError.Visible = false;
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "No se encontraron registros";
                }
            }


            GridViewProductos.SelectedIndex = -1;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            LlenarGridProductos();
            txtBusqueda.Text = "";
            lblError.Visible = false;

            GridViewProductos.SelectedIndex = -1;
        }

        protected void GridViewProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewProductos.PageIndex = e.NewPageIndex;
            LlenarGridProductos();
            GridViewProductos.SelectedIndex = -1;
        }

        protected void GridViewProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            string cod = Convert.ToString(GridViewProductos.Rows[i].Cells[2].Text);
            con.Open();
            SqlCommand co = new SqlCommand("exec EliminarProductos '" + cod + "'", con);
            co.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Eliminado correctamente.');", true);
            LlenarGridProductos();
        }

        protected void GridViewProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCodigo.Text = GridViewProductos.SelectedRow.Cells[2].Text;
            txtProveedor.Text = GridViewProductos.SelectedRow.Cells[3].Text;
            txtProducto.Text = GridViewProductos.SelectedRow.Cells[4].Text;
            txtFamilia.Text = GridViewProductos.SelectedRow.Cells[5].Text;
            txtGrupo.Text = GridViewProductos.SelectedRow.Cells[6].Text;
            txtSubGrupo.Text = GridViewProductos.SelectedRow.Cells[7].Text;
            Label3.Visible = true;
            txtCodigo.Visible = true;
            btnInsertar.Visible = false;
            btnEditar.Visible = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Label3.Visible = false;
            txtCodigo.Visible = false;
            btnInsertar.Visible = true;
            btnEditar.Visible = false;
            VaciarCampos();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtProducto.Text) || string.IsNullOrEmpty(txtFamilia.Text) || string.IsNullOrEmpty(txtGrupo.Text)
                || string.IsNullOrEmpty(txtSubGrupo.Text) || string.IsNullOrEmpty(txtProveedor.Text))
            {


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Por favor llene los campos.');", true);


            }

            else
            {
                string nombre = txtProducto.Text;
                int cod = Convert.ToInt32(txtCodigo.Text), proveedor = Convert.ToInt32(txtProveedor.Text), familia = Convert.ToInt32(txtFamilia.Text),
                grupo = Convert.ToInt32(txtGrupo.Text), subgrupo = Convert.ToInt32(txtSubGrupo.Text);
                con.Open();
                SqlCommand co = new SqlCommand("exec EditarProductos '" + cod + "','" + proveedor + "','" + nombre + "','" + familia + "','" + grupo + "','" + subgrupo + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Editado correctamente.');", true);
                LlenarGridProductos();
                VaciarCampos();
            }

            GridViewProductos.SelectedIndex = -1;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteProductos.aspx");
        }
    }
}