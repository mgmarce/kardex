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
    public partial class Proveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {

                LlenarGridProveedores();

            }
        }

        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
        void LlenarGridProveedores()
        {

            SqlCommand co = new SqlCommand("exec ListarProveedores", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewProveedores.DataSource = dt;
            GridViewProveedores.DataBind();
        }

        public void VaciarCampos()
        {
            txtEmpresa.Text = "";
            txtRubro.Text = "";
            txtRazonSocial.Text = "";
            txtTelefono.Text = "";
            txtNIT.Text = "";
            txtDireccion.Text = "";
            txtCorreo.Text = "";
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEmpresa.Text) || string.IsNullOrEmpty(txtRubro.Text) || string.IsNullOrEmpty(txtRazonSocial.Text)
               || string.IsNullOrEmpty(txtTelefono.Text) || string.IsNullOrEmpty(txtNIT.Text) || string.IsNullOrEmpty(txtDireccion.Text) || string.IsNullOrEmpty(txtCorreo.Text))
            {


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Por favor llene los campos.');", true);


            }

            else
            {
                string nombre = txtEmpresa.Text, rubro = txtRubro.Text, razon = txtRazonSocial.Text, telefono = txtTelefono.Text, nit = txtNIT.Text, direccion = txtDireccion.Text, correo = txtCorreo.Text;
                con.Open();
                SqlCommand co = new SqlCommand("InsertarProveedor'" + nombre + "','" + rubro + "','" + razon + "','" + nit + "','" + telefono + "','" + correo + "','" + direccion + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                LlenarGridProveedores();

            }

            VaciarCampos();
            GridViewProveedores.SelectedIndex = -1;
        }

        protected void GridViewProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewProveedores.PageIndex = e.NewPageIndex;
            LlenarGridProveedores();
            GridViewProveedores.SelectedIndex = -1;
        }

        protected void GridViewProveedores_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCod.Text = GridViewProveedores.SelectedRow.Cells[1].Text;
            txtEmpresa.Text = GridViewProveedores.SelectedRow.Cells[2].Text;
            txtRubro.Text = GridViewProveedores.SelectedRow.Cells[3].Text;
            txtRazonSocial.Text = GridViewProveedores.SelectedRow.Cells[4].Text;
            txtNIT.Text = GridViewProveedores.SelectedRow.Cells[5].Text;
            txtTelefono.Text = GridViewProveedores.SelectedRow.Cells[6].Text;
            txtCorreo.Text = GridViewProveedores.SelectedRow.Cells[7].Text;
            txtDireccion.Text = GridViewProveedores.SelectedRow.Cells[8].Text;

            Label3.Visible = true;
            txtCod.Visible = true;
            btnInsertar.Visible = false;
            btnEditar.Visible = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Label3.Visible = false;
            txtCod.Visible = false;
            btnInsertar.Visible = true;
            btnEditar.Visible = false;
            VaciarCampos();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEmpresa.Text) || string.IsNullOrEmpty(txtRubro.Text) || string.IsNullOrEmpty(txtRazonSocial.Text)
             || string.IsNullOrEmpty(txtTelefono.Text) || string.IsNullOrEmpty(txtNIT.Text) || string.IsNullOrEmpty(txtDireccion.Text) || string.IsNullOrEmpty(txtCorreo.Text))
            {


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Por favor llene los campos.');", true);


            }

            else
            {
                int cod = Convert.ToInt32(txtCod.Text);
                string nombre = txtEmpresa.Text, rubro = txtRubro.Text, razon = txtRazonSocial.Text, telefono = txtTelefono.Text, nit = txtNIT.Text, direccion = txtDireccion.Text, correo = txtCorreo.Text;
                con.Open();
                SqlCommand co = new SqlCommand("EditarProveedor '" + cod + "','" + nombre + "','" + rubro + "','" + razon + "','" + nit + "','" + telefono + "','" + correo + "','" + direccion + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Editado correctamente.');", true);
                LlenarGridProveedores();

            }

            VaciarCampos();
            GridViewProveedores.SelectedIndex = -1;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBusqueda.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir algo para buscar.');", true);
            }
            else
            {
                SqlCommand co = new SqlCommand("select IdProveedor as 'Codigo Proveedor',empresa as 'Nombre', rubro as 'Rubro', razon_social  as 'Razon Social',NIT as 'NIT', telefono as 'Telefono', correo as 'Correo', direccion as 'Direccion', FechaRegistro as 'Fecha de Registro' from PROVEEDOR where " + cboBusqueda.SelectedValue + " like '%" + txtBusqueda.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewProveedores.DataSource = dt;
                GridViewProveedores.DataBind();

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


            GridViewProveedores.SelectedIndex = -1;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {

            txtBusqueda.Text = "";
            LlenarGridProveedores();

            lblError.Visible = false;

            GridViewProveedores.SelectedIndex = -1;

        }


    }

}