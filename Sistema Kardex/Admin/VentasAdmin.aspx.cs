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
    public partial class VentasAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {

                LlenarGrid();

            }
        }
        //conexion
        SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
        // SqlConnection con = new SqlConnection(@"server=LAPTOP-O17HLAGC\SQLEXPRESS; Initial Catalog = DBPROYECTO; Integrated Security=True;");

        void LlenarGrid()
        {
            SqlCommand co = new SqlCommand("exec ListarVentasDetalle", con);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }



        protected void btnBuscar_Click1(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBuscar.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir algo para buscar.');", true);
            }
            else
            {
                SqlCommand co = new SqlCommand("select fecha as 'Fecha', IdVenta as 'ID', IdSala as 'Id Sala', IdProducto as 'Id producto', cantidad_producto as 'Cantidad', nombre_producto as 'Nombre Producto', venta_total as 'Total', tipoDocumento AS 'Documento emitido' from DETALLE_VENTA where " + DropDownList1.SelectedValue + " like '%" + txtBuscar.Text + "%'", con);
                SqlDataAdapter sd = new SqlDataAdapter(co);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (dt.Rows.Count >= 1)
                {
                    Label1.Visible = false;
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "No se encontraron registros";
                }
            }
            GridView1.SelectedIndex = -1;
        }
        

        protected void VerTodos_Click(object sender, EventArgs e)
        {
            LlenarGrid();
            txtBuscar.Text = "";
            Label1.Visible = false;
            GridView1.SelectedIndex = -1;
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGrid();
            GridView1.SelectedIndex = -1;
        }

        protected void btnReporte_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReportVentas.aspx");
        }
    }
}
