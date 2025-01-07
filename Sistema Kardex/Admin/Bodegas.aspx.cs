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
    public partial class Bodegas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {

                LlenarGridProductosBodega();

            }
        }
        
        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");

        void LlenarGridProductosBodega()
        {
            
            SqlCommand co = new SqlCommand("exec ListarBodegas", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewProductosBodega.DataSource = dt;
            GridViewProductosBodega.DataBind();
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtProducto.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir un codigo para buscar.');", true);
            }
            else
            {
                int cod = Convert.ToInt32(txtProducto.Text);
                con.Open();
                SqlCommand co = new SqlCommand("CodProductos '" + cod  + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                SqlDataAdapter sda = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count == 1)
                {
                    
                    txtNombreProducto.Text = dt.Rows[0][1].ToString(); 
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se encontraron productos con ese codigo.');", true);

                }
            }


        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtSala.Text) || string.IsNullOrEmpty(txtProducto.Text) || string.IsNullOrEmpty(txtNombreProducto.Text)
                || string.IsNullOrEmpty(txtUnidadCompra.Text) || string.IsNullOrEmpty(txtUnidadVenta.Text))
            {


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Por favor llene los campos.');", true);


            }

            else
            {
                string nombre = txtNombreProducto.Text;
                int codproducto = Convert.ToInt32(txtProducto.Text), idsala = Convert.ToInt32(txtSala.Text),
                stock = 0, ingreso = 0, egresos = 0;
                decimal unidadcompra = Convert.ToDecimal(txtUnidadCompra.Text), unidadventa = Convert.ToDecimal(txtUnidadVenta.Text);
                con.Open();
                SqlCommand co = new SqlCommand("InsertarProducBodega '" + idsala+ "','" + codproducto + "','" + nombre  + "','" + unidadcompra + "','" + unidadventa + "','" + ingreso + "','" + egresos + "','" + stock + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                LlenarGridProductosBodega();
              
            }

            VaciarCampos();
            GridViewProductosBodega.SelectedIndex = -1;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBusqueda.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir algo para buscar.');", true);
            }
            else
            {
                SqlCommand co = new SqlCommand("select IdSala as 'Codigo Sala',IdProducto as 'Codigo Producto', NombreProducto as 'Nombre Producto', PrecioUnidadCompra  as 'Precio Compra',PrecioUnidadVenta as 'Precio Venta', ingresos as 'Ingresos', egresos as 'Egresos', stock as 'Stock', Estado as 'Estado', FechaRegistro as 'Fecha de Registro' from BODEGA where " + cboBusqueda.SelectedValue + " like '%" + txtBusqueda.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewProductosBodega.DataSource = dt;
                GridViewProductosBodega.DataBind();

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


            GridViewProductosBodega.SelectedIndex = -1;
        }

        public void VaciarCampos()
        {
            txtSala.Text = "";
            txtProducto.Text = "";
            txtNombreProducto.Text = "";
            txtUnidadCompra.Text = "";
            txtUnidadVenta.Text = "";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            VaciarCampos();
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            LlenarGridProductosBodega();
            txtBusqueda.Text = "";
        }

        protected void GridViewProductosBodega_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewProductosBodega.PageIndex = e.NewPageIndex;
            LlenarGridProductosBodega();
            GridViewProductosBodega.SelectedIndex = -1;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteBodega.aspx");
        }
    }
}