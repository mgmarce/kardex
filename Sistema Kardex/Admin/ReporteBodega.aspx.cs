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
    public partial class ReproteBodega : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public void ObtenerInfo()
        {

            ReportViewer1.Visible = true;
            SqlConnection cn = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
            SqlDataAdapter da = new SqlDataAdapter("select idSala,IdProducto,NombreProducto,PrecioUnidadVenta,ingresos,egresos,Stock,Estado from BODEGA where Estado = '" + Convert.ToString(DropDownList1.Text) + "'", cn);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReporteBodega.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataBodegas", dt));
            ReportViewer1.LocalReport.Refresh();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ObtenerInfo();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bodegas.aspx");
        }
    }
}