using Microsoft.Reporting.WebForms;
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
    public partial class VentasUsuario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {

                
            }
            if (Session["cod"] != null)
            {
                txtCod.Text = ((int)Session["cod"]).ToString();
                LlenarGrid();
            }

        }

        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
        public DataTable dt;
        public SqlDataAdapter sda;
        public SqlDataReader dr;

        void LlenarGrid()
        {
            int codMismo = (int)Session["cod"];
            SqlCommand co = new SqlCommand("SeleccionarDetalleVenta '" + codMismo + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridViewVentas.DataSource = dt;
            GridViewVentas.DataBind();
            GridViewVentas.Visible = true;
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
                    camposFactura();
                    txtTipo.Text = "Factura";
                    ListComprobante.Visible = false;
                    btnAceptar.Visible = false;
                    btnBuscar.Visible = true;
                    btnCalcular.Visible = true;
                    break;
                case "ticket":
                    camposTicket();
                    txtTipo.Text = "Ticket";
                    ListComprobante.Visible = false;
                    btnAceptar.Visible = false;
                    btnBuscar.Visible = true;
                    btnCalcular.Visible = true;
                    break;
                case "credito fiscal":
                    camposCreditoFiscal();
                    txtTipo.Text = "Credito Fiscal";
                    ListComprobante.Visible = false;
                    btnAceptar.Visible = false;
                    btnBuscar.Visible = true;
                    btnCalcular.Visible = true;
                    break;
            }
            


        }

        

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string tipoDocumento = txtTipo.Text.ToLower();
            if (tipoDocumento == "factura")
            {
                if (string.IsNullOrEmpty(txtIdPro.Text)|| string.IsNullOrEmpty(txtCantidad.Text)|| string.IsNullOrEmpty(txtIdSala.Text)||
                     string.IsNullOrEmpty(txtCliente.Text)|| string.IsNullOrEmpty(txtDireccion.Text)
                    || string.IsNullOrEmpty(txtNit.Text)|| string.IsNullOrEmpty(txtProducto.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe llenar los campos');", true);
                }
                else
                {
                    int idProducto = Convert.ToInt32(txtIdPro.Text), idVenta = (int)Session["cod"], cantidad = Convert.ToInt32(txtCantidad.Text);
                    int idSala = Convert.ToInt32(txtIdSala.Text);
                    string cliente = txtCliente.Text, direccion = txtDireccion.Text, nit = txtNit.Text, NomPro = txtProducto.Text;

                    decimal vu = Convert.ToDecimal(txtVU.Text), total = Convert.ToDecimal(txtTotal.Text);
                    con.Open();
                    SqlCommand co = new SqlCommand("Insert into DETALLE_VENTA (IdVenta, IdProducto, cantidad_producto, nombre_producto, precio_unitario, venta_Total, IdSala, tipoDocumento, nombre_cliente, NIT, direccioncliente) values('" + idVenta + "', '" + idProducto + "', '" + cantidad + "','" + NomPro + "', '" + vu + "', '" + total + "', '" + idSala + "', '" + tipoDocumento + "', '" + cliente + "', '" + nit + "', '" + direccion + "')", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGrid();
                    Limpiar();
                    btnGenerar.Visible = true;
                }

            }
            else if(tipoDocumento == "credito fiscal")
            {
                if (string.IsNullOrEmpty(txtIdPro.Text) || string.IsNullOrEmpty(txtCantidad.Text) || string.IsNullOrEmpty(txtIdSala.Text) ||
                    string.IsNullOrEmpty(txtCliente.Text) || string.IsNullOrEmpty(txtDireccion.Text)
                    || string.IsNullOrEmpty(txtNit.Text) || string.IsNullOrEmpty(txtProducto.Text)|| string.IsNullOrEmpty(txtNRC.Text)|| string.IsNullOrEmpty(txtGiro.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe llenar los campos');", true);
                }
                else
                {
                    int idProducto = Convert.ToInt32(txtIdPro.Text), idVenta = (int)Session["cod"], cantidad = Convert.ToInt32(txtCantidad.Text);
                    int idSala = Convert.ToInt32(txtIdSala.Text);
                    string cliente = txtCliente.Text, direccion = txtDireccion.Text, nit = txtNit.Text, NomPro = txtProducto.Text, nrc = txtNRC.Text, giro = txtGiro.Text;

                    decimal vu = Convert.ToDecimal(txtVU.Text), total = Convert.ToDecimal(txtTotal.Text);
                    con.Open();
                    SqlCommand co = new SqlCommand("Insert into DETALLE_VENTA (IdVenta, IdProducto, cantidad_producto, nombre_producto, precio_unitario, venta_Total, IdSala, tipoDocumento, nombre_cliente, NIT, direccioncliente, NRC, giro) values('" + idVenta + "', '" + idProducto + "', '" + cantidad + "','" + NomPro + "', '" + vu + "', '" + total + "', '" + idSala + "', '" + tipoDocumento + "', '" + cliente + "', '" + nit + "', '" + direccion + "', '"  + nrc + "', '" + giro + "')", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGrid();
                    Limpiar();
                    btnGenerar.Visible = true;
                }

            }
            else if (tipoDocumento == "ticket")
            {
                if (string.IsNullOrEmpty(txtIdPro.Text) || string.IsNullOrEmpty(txtCantidad.Text) || string.IsNullOrEmpty(txtIdSala.Text) ||
                    string.IsNullOrEmpty(txtProducto.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe llenar los campos');", true);
                }
                else
                {
                    int idProducto = Convert.ToInt32(txtIdPro.Text), idVenta = (int)Session["cod"], cantidad = Convert.ToInt32(txtCantidad.Text);
                    int idSala = Convert.ToInt32(txtIdSala.Text);
                    string NomPro = txtProducto.Text;

                    decimal vu = Convert.ToDecimal(txtVU.Text), total = Convert.ToDecimal(txtTotal.Text);
                    con.Open();
                    SqlCommand co = new SqlCommand("Insert into DETALLE_VENTA (IdVenta, IdProducto, cantidad_producto, nombre_producto, precio_unitario, venta_Total, IdSala, tipoDocumento) values('" + idVenta + "', '" + idProducto + "', '" + cantidad + "','" + NomPro + "', '" + vu + "', '" + total + "', '" + idSala + "', '" + tipoDocumento  + "')", con);
                    co.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Registrado correctamente.');", true);
                    LlenarGrid();
                    Limpiar();
                    btnGenerar.Visible = true;
                }
                
            }else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error en ingresar los datos.');", true);

            }

        }


        public void Limpiar()
        {
            txtIdPro.Text = "";
            txtProducto.Text = "";
            txtCantidad.Text = "";
            txtVU.Text = "";
            txtTotal.Text = "";
        }

        public void camposFactura()
        {
            lblIdSala.Visible = true;
            txtIdSala.Visible = true;
            lblTipoDocument.Visible = true;
            txtTipo.Visible = true;
            lblCliente.Visible = true;
            txtCliente.Visible = true;
            lblNIT.Visible = true;
            txtNit.Visible = true;
            LBLNRC.Visible = false;
            txtNRC.Visible = false;
            lblGiro.Visible = false;
            txtGiro.Visible = false;
            lblDireccion.Visible = true;
            txtDireccion.Visible = true;
            lblIdPro.Visible = true;
            txtIdPro.Visible = true;
            lblPro.Visible = true;
            txtProducto.Visible = true;
            lblCantidad.Visible = true;
            txtCantidad.Visible = true;
            lblVU.Visible = true;
            txtVU.Visible = true;
            lblTotal.Visible = true;
            txtTotal.Visible = true;
        }

        public void camposTicket()
        {
            lblTipoDocument.Visible = true;
            txtTipo.Visible = true;
            lblIdSala.Visible = true;
            txtIdSala.Visible = true;
            lblCliente.Visible = false;
            txtCliente.Visible = false;
            lblDireccion.Visible = false;
            txtDireccion.Visible = false;
            lblNIT.Visible = false;
            txtNit.Visible = false;
            LBLNRC.Visible = false;
            lblGiro.Visible = false;
            txtGiro.Visible = false;
            lblIdPro.Visible = true;
            txtIdPro.Visible = true;
            lblPro.Visible = true;
            txtProducto.Visible = true;
            lblCantidad.Visible = true;
            txtCantidad.Visible = true;
            lblVU.Visible = true;
            txtVU.Visible = true;
            lblTotal.Visible = true;
            txtTotal.Visible = true;
            
        }


        public void camposCreditoFiscal()
        {
            lblTipoDocument.Visible = true;
            txtTipo.Visible = true;
            lblIdSala.Visible = true;
            txtIdSala.Visible = true;
            lblCliente.Visible = true;
            txtCliente.Visible = true;
            lblDireccion.Visible = true;
            txtDireccion.Visible = true;
            lblNIT.Visible = true;
            txtNit.Visible = true;
            LBLNRC.Visible = true;
            txtNRC.Visible = true;
            lblGiro.Visible = true;
            txtGiro.Visible = true;
            lblIdPro.Visible = true;
            txtIdPro.Visible = true;
            lblPro.Visible = true;
            txtProducto.Visible = true;
            lblCantidad.Visible = true;
            txtCantidad.Visible = true;
            lblVU.Visible = true;
            txtVU.Visible = true;
            lblTotal.Visible = true;
            txtTotal.Visible = true;

        }
        

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtIdPro.Text) || string.IsNullOrEmpty(txtIdSala.Text) || string.IsNullOrEmpty(txtCantidad.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe llenar los campos');", true);
            }
            else
            {
                int idPro = Convert.ToInt32(txtIdPro.Text);
                int IdSala = Convert.ToInt32(txtIdSala.Text);

                con.Open();
                SqlCommand co = new SqlCommand("select stock from BODEGA where IdProducto =  '" + idPro + "' and IdSala = '" + IdSala + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                SqlDataAdapter sda = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count == 1)
                {
                    string cantidad = dt.Rows[0][0].ToString();
                    int Cant = Convert.ToInt32(cantidad), Cant1 = Convert.ToInt32(txtCantidad.Text);
                    if (Cant >= Cant1)
                    {
                        decimal vu = Convert.ToDecimal(txtVU.Text), total;

                        total = Cant1 * vu;
                        txtTotal.Text = total.ToString();
                        btnIngresar.Visible = true;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No hay suficiente producto en Bodega');", true);

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se encontraron productos con ese codigo en Bodega');", true);

                }
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtIdPro.Text) || string.IsNullOrEmpty(txtIdSala.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe llenar los campos');", true);
            }
            else
            {
                int idPro = Convert.ToInt32(txtIdPro.Text);
                int IdSala = Convert.ToInt32(txtIdSala.Text);

                con.Open();
                SqlCommand co = new SqlCommand("select NombreProducto, precioUnidadVenta from BODEGA where IdProducto =  '" + idPro + "' and IdSala = '" + IdSala + "'", con);
                co.ExecuteNonQuery();
                con.Close();
                SqlDataAdapter sda = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count == 1)
                {
                    txtProducto.Text = dt.Rows[0][0].ToString();
                    txtVU.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se encontraron productos con ese codigo en Bodega');", true);

                }
            }
            
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            string comprobante = txtTipo.Text.ToLower();
            int idVenta = Convert.ToInt32(txtCod.Text);

            switch (comprobante)
            {
                case "factura":
                   
                    ObtenerInfoFactura(idVenta);
                    RVFactura.Visible = true;
                    GridViewVentas.Visible = false;
                    desaparecerCampos();
                    btnGenerar.Visible = false;
                    RVFactura.Height = 600;
                    RVFactura.Width = 800;
                    break;
                case "ticket":
                    
                    ObtenerInfoTicket(idVenta);
                    RVFactura.Visible = true;
                    GridViewVentas.Visible = false;
                    desaparecerCampos();
                    btnGenerar.Visible = false;
                    RVTicket.Height = 500;
                    RVTicket.Width = 800;
                    break;
                case "credito fiscal":
                    ObtenerInfoCreditoFiscal(idVenta);
                    RVCreditoFiscal.Visible = true;
                    GridViewVentas.Visible = false;
                    desaparecerCampos();
                    btnGenerar.Visible = false;
                    RVCreditoFiscal.Height = 500;
                    RVCreditoFiscal.Width = 700;
                    break;
            }
            //int idVenta = (int)Session["cod"];
            /*int idVenta = Convert.ToInt32(txtCod.Text);
            ObtenerInfoFactura(idVenta);
            RVFactura.Visible = true;
            
            GridViewVentas.Visible = false;*/
            //txtCod.Text = "";

            /*desaparecerCampos();
            btnGenerar.Visible = false;*/
            btnNuevaVenta.Visible = true;
            btnAceptar.Visible = false;
        }



        public void desaparecerCampos()
        {
            lblIdSala.Visible = false;
            txtIdSala.Visible = false;
            lblCliente.Visible = false;
            txtCliente.Visible = false;
            lblDireccion.Visible = false;
            txtDireccion.Visible = false;
            lblNIT.Visible = false;
            txtNit.Visible = false;
            LBLNRC.Visible = false;
            txtNRC.Visible = false;
            lblGiro.Visible = false;
            txtGiro.Visible = false;
            lblIdPro.Visible = false;
            txtIdPro.Visible = false;
            lblPro.Visible = false;
            txtProducto.Visible = false;
            lblCantidad.Visible = false;
            txtCantidad.Visible = false;
            lblVU.Visible = false;
            txtVU.Visible = false;
            lblTotal.Visible = false;
            txtTotal.Visible = false;
            btnAceptar.Visible = true;
            btnCalcular.Visible = false;
            btnBuscar.Visible = false;
            btnIngresar.Visible = false;
            txtTipo.Text = "";
            lblTipoDocument.Visible = false;
            txtTipo.Visible = false;
            
        }

        public void ObtenerInfoFactura(int IdVenta)
        {
                SqlDataAdapter da = new SqlDataAdapter("select IdVenta, IdSala, IdProducto, cantidad_producto, nombre_producto, precio_unitario, venta_Total, nombre_cliente, tipoDocumento, NRC, NIT, direccioncliente, giro from DETALLE_VENTA WHERE IdVenta =  '" + IdVenta + "'", con);
                DataTable dt = new DataTable("table1");
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    RVFactura.Visible = true;

                    RVFactura.ProcessingMode = ProcessingMode.Local;
                    RVFactura.LocalReport.ReportPath = Server.MapPath("Factura.rdlc");
                    RVFactura.LocalReport.DataSources.Clear();
                    RVFactura.LocalReport.DataSources.Add(new ReportDataSource("dsFactura", dt));
                    RVFactura.LocalReport.Refresh();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se encontraron Registros');", true);

                }

            

        }
        public void ObtenerInfoTicket(int IdVenta)
        {
            SqlDataAdapter da = new SqlDataAdapter("select IdVenta, IdSala, IdProducto, cantidad_producto, nombre_producto, precio_unitario, venta_Total, tipoDocumento from DETALLE_VENTA WHERE IdVenta =  '" + IdVenta + "'", con);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                RVFactura.Visible = true;

                RVFactura.ProcessingMode = ProcessingMode.Local;
                RVFactura.LocalReport.ReportPath = Server.MapPath("Ticket.rdlc");
                RVFactura.LocalReport.DataSources.Clear();
                RVFactura.LocalReport.DataSources.Add(new ReportDataSource("dsTicket", dt));
                RVFactura.LocalReport.Refresh();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se encontraron Registros');", true);

            }
        }
        public void ObtenerInfoCreditoFiscal(int IdVenta)
        {
            SqlDataAdapter da = new SqlDataAdapter("select IdVenta, IdSala, IdProducto, cantidad_producto, nombre_producto, precio_unitario, venta_Total, nombre_cliente, tipoDocumento, NRC, NIT, direccioncliente, giro from DETALLE_VENTA WHERE IdVenta =  '" + IdVenta + "'", con);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                RVFactura.Visible = true;

                RVFactura.ProcessingMode = ProcessingMode.Local;
                RVFactura.LocalReport.ReportPath = Server.MapPath("CreditoFiscal.rdlc");
                RVFactura.LocalReport.DataSources.Clear();
                RVFactura.LocalReport.DataSources.Add(new ReportDataSource("dsCreditoFiscal", dt));
                RVFactura.LocalReport.Refresh();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se encontraron Registros');", true);

            }
        }


        protected void btnNuevaVenta_Click(object sender, EventArgs e)
        {

            Session["cod"] = null;
            txtCod.Text = "";
            GridViewVentas.Visible = false;
            RVFactura.Visible = false;
            RVTicket.Visible = false;
            RVCreditoFiscal.Visible = false;
            Limpiar();
            limpiar2();
            btnAceptar.Visible = true;
            btnNuevaVenta.Visible = false;
        }

        void limpiar2()
        {
            ListComprobante.Visible = true;
            txtTipo.Text = "";
            txtIdSala.Text = "";
            txtNit.Text = "";
            txtCliente.Text = "";
            txtDireccion.Text = "";
            txtGiro.Text = "";
        }
    }

}
