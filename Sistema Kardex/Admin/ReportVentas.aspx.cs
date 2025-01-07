using Microsoft.Reporting.WebForms;
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
    public partial class ReportVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void ObtenerInfo()
        {

            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text))
            {


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Por favor llene los campos.');", true);


            }

            else
            {

                ReportViewer1.Visible = true;
                SqlConnection cn = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
                SqlDataAdapter da = new SqlDataAdapter("select * from DETALLE_VENTA where fecha between '" + Convert.ToDateTime(TextBox1.Text) + "' and '" + Convert.ToDateTime(TextBox2.Text) + "'", cn);
                DataTable dt = new DataTable("table1");
                da.Fill(dt);
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReporteVentas.rdlc");
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataVentas", dt));
                ReportViewer1.LocalReport.Refresh();
            }


        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            ObtenerInfo();
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("VentasAdmin.aspx");
        }
    }
}