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
    public partial class detalleCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {
                //LlenarGrid();
            }
            if (Session["cod"] != null)
            {
                txtCod.Text = ((int)Session["cod"]).ToString();
                GridViewCompras.DataSource = null;
                GridViewCompras.DataBind();
            }

        }
        
        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
        public DataTable dt2;
        public SqlDataAdapter sda2;

       
        void LlenarGrid()
        {
            SqlCommand co = new SqlCommand("exec ListarCompras", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewCompras.DataSource = dt;
            GridViewCompras.DataBind();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Random rdn = new Random();
            int a = rdn.Next(1, 100000);


            if (Session["cod"] != null)
            {
                a = (int)Session["cod"];
            }

            txtCod.Text = a.ToString();

            Session["cod"] = a;

            string comprobante = ListComprobante.Text.ToLower();

            switch (comprobante)
            {
                case "factura":
                    ListComprobante.Visible = false;
                    btnAceptar.Visible = false;
                    txtComprobante.Text = "Factura";
                    break;
                case "ticket":
                    ListComprobante.Visible = false;
                    btnAceptar.Visible = false;
                    txtComprobante.Text = "Ticket";
                    break;
                case "credito fiscal":
                    ListComprobante.Visible = false;
                    btnAceptar.Visible = false;
                    txtComprobante.Text = "credito fiscal";
                    break;
            }

            GridViewCompras.DataSource = null;
           GridViewCompras.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
           
            string tipoDocumento = txtComprobante.Text.ToLower();
            if (tipoDocumento == "factura" || tipoDocumento == "ticket" || tipoDocumento == "credito fiscal")
            {
                if (string.IsNullOrEmpty(txtIdProducto.Text) || string.IsNullOrEmpty(txtCantidad.Text) || string.IsNullOrEmpty(txtIdSala.Text)
                    || string.IsNullOrEmpty(txtIdProveedor.Text) || string.IsNullOrEmpty(txtNomProducto.Text) || string.IsNullOrEmpty(txtProveedor.Text) ||
                    string.IsNullOrEmpty(txtComprobante.Text) || string.IsNullOrEmpty(txtValorUnitario.Text) || string.IsNullOrEmpty(txtCompraTotal.Text) )
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe llenar los campos');", true);
                }
                else
                {
                    int idProducto = Convert.ToInt32(txtIdProducto.Text), IdCompra = (int)Session["cod"], cantidad = Convert.ToInt32(txtCantidad.Text);
                    int idSala = Convert.ToInt32(txtIdSala.Text), idProveedor = Convert.ToInt32(txtIdProveedor.Text);
                    string NomPro = txtNomProducto.Text, proveedor = txtProveedor.Text, comprobante = txtComprobante.Text;
                    decimal vu = Convert.ToDecimal(txtValorUnitario.Text), total = Convert.ToDecimal(txtCompraTotal.Text);


                    con.Open();
                    SqlCommand co = new SqlCommand("insert into DETALLE_COMPRA(Idcompra,IdSala, IdProveedor, nombre_proveedor,tipoDocumento, idProducto, cantidad_producto, nombre_producto, precio_unitario, Compra_total)values('" + IdCompra + "', '" + idSala + "', '" + idProveedor + "','" + proveedor + "','" + comprobante + "', '" + idProducto + "', '" + cantidad + "', '" + NomPro + "', '" + vu + "', '" + total + "')", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGrid();
                    Limpiar();
                    btnFinalizar.Visible = true;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Comprobante de Compra erroneo.');", true);

            }
        }

        void Limpiar()
        {

            txtIdProducto.Text = "";
            txtNomProducto.Text = "";
            txtCantidad.Text = "";
            txtCompraTotal.Text = "";
            txtValorUnitario.Text = "";
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            Session["cod"] = null;
            txtCod.Text = "";
            ListComprobante.Visible = true;
            btnAceptar.Visible = true;
            txtComprobante.Text = "";
            Limpiar();
            txtIdSala.Text = "";
            txtIdProveedor.Text = "";
            txtProveedor.Text = "";
            txtIdProducto.Text = "";
            
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtIdProducto.Text) || string.IsNullOrEmpty(txtIdSala.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe llenar los campos');", true);
            }
            else
            {
                int idPro = Convert.ToInt32(txtIdProducto.Text);
                int IdSala = Convert.ToInt32(txtIdSala.Text);

                con.Open();
                SqlCommand co = new SqlCommand("select NombreProducto from BODEGA where IdProducto =  '" + idPro + "' and IdSala = '" + IdSala + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                SqlDataAdapter sda = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count == 1)
                {
                    txtNomProducto.Text = dt.Rows[0][0].ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('El producto no esta registrado En Bodega');", true);

                }
            }
        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCantidad.Text) || string.IsNullOrEmpty(txtCompraTotal.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe llenar los campos');", true);
            }
            else
            {

                int cantidad = Convert.ToInt32(txtCantidad.Text);
                decimal compraTotal = Convert.ToDecimal(txtCompraTotal.Text), vu;
                vu = compraTotal / cantidad;
                txtValorUnitario.Text = vu.ToString();
            }


        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBusqueda.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir algo para buscar.');", true);
            }
            else
            {
                SqlCommand co = new SqlCommand("select IdCompra as 'Cod compra', IdSala as 'Sala', IdProveedor as 'Proveedor',numeroCompra as 'Compra numero',nombre_producto as 'Producto',cantidad_producto as 'Cantidad',Compra_Total as 'Total' from DETALLE_COMPRA where " + ListBusqueda.SelectedValue + " like '%" + txtBusqueda.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridViewCompras.DataSource = dt;
                GridViewCompras.DataBind();

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


            GridViewCompras.SelectedIndex = -1;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteCompras.aspx");
        }
    }
}