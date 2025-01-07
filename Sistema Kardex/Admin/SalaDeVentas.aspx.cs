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
    public partial class SalaDeVentas : System.Web.UI.Page
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
            SqlCommand co = new SqlCommand("listar_SalaVentas", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewSalaVenta.DataSource = dt;
            GridViewSalaVenta.DataBind();
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
                SqlCommand co1 = new SqlCommand("select * from SALA_VENTA where Nombre = '" + txtNombre.Text + "'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co1);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewSalaVenta.DataSource = dt;
                GridViewSalaVenta.DataBind();

                if (dt.Rows.Count == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Ya exite un registro con ese codigo, ingrese otro.');", true);
                }
                else
                {
                    string NomSala = txtNombre.Text;
                    string Direccion = txtDireccion.Text;
                    string Telefono = txtTelefono.Text;

                    con.Open();
                    SqlCommand co = new SqlCommand("exec agregar_SalaVentas '" + NomSala + "','"+Direccion+"','" + Telefono + "'", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGrid();
                    VaciarCampos();
                    lblInformacion.Visible = false;
                }

            }

            GridViewSalaVenta.SelectedIndex = -1;

        }

        protected void GridViewSalaVenta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewSalaVenta.PageIndex = e.NewPageIndex;
            LlenarGrid();
            GridViewSalaVenta.SelectedIndex = -1;
        }

        public void VaciarCampos()
        {
            txtId.Text = "";
            txtNombre.Text = "";
            txtDireccion.Text = "";
            txtTelefono.Text = "";
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
            string Nombre= txtNombre.Text;
            string Direccion = txtDireccion.Text;
            string Telefono = txtTelefono.Text;
            int id = Convert.ToInt32(txtId.Text);
            con.Open();
            SqlCommand co = new SqlCommand("exec Editar_SalaVentas '" + id + "','" + Nombre + "','" + Direccion + "','"+Telefono+"'", con);
            co.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Actualizado correctamente.');", true);
            btnInsertar.Visible = true;
            btnEditar.Visible = false;
            LlenarGrid();
            VaciarCampos();

            GridViewSalaVenta.SelectedIndex = -1;

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
                SqlCommand co = new SqlCommand("select IdSala as 'ID', Nombre as 'Nombre', Direccion as 'Direccion', Telefono as 'Telefono',FechaRegistro as 'Fecha de registro' from SALA_VENTA where " + ListaBusqueda.SelectedValue + " like '%" + txtBusqueda.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewSalaVenta.DataSource = dt;
                GridViewSalaVenta.DataBind();

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

            GridViewSalaVenta.SelectedIndex = -1;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            LlenarGrid();
            txtBusqueda.Text = "";
            GridViewSalaVenta.SelectedIndex = -1;

        }


        protected void SelectIndexSalaVenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblId.Visible = true;
            lblFecha.Visible = true;
            txtFecha.Visible = true;
            txtId.Visible = true;
            txtId.Text = GridViewSalaVenta.SelectedRow.Cells[1].Text;
            txtNombre.Text = GridViewSalaVenta.SelectedRow.Cells[2].Text;
            txtDireccion.Text = GridViewSalaVenta.SelectedRow.Cells[3].Text;
            txtTelefono.Text = GridViewSalaVenta.SelectedRow.Cells[4].Text;
            txtFecha.Text = GridViewSalaVenta.SelectedRow.Cells[5].Text;
            btnInsertar.Visible = false;
            btnEditar.Visible = true;
            lblNuevo.Visible = false;
            lblInformacion.Visible = false;
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteSalaVenta.aspx");
        }

        /*protected void GridViewDeleting_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            string cod = Convert.ToString(GridViewSalaVenta.Rows[i].Cells[2].Text);
            con.Open();
            SqlCommand co = new SqlCommand("exec Eliminar_SalaVentas '" + cod + "'", con);
            co.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Eliminado correctamente.');", true);
            LlenarGrid();
            lblInformacion.Visible = false;
        }*/
    }
}