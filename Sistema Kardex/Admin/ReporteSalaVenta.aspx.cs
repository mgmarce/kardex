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
    public partial class ReporteSalaVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            ObtenerInfo();
            
        }

        public void ObtenerInfo()
        {
            if (string.IsNullOrEmpty(txtDireccion.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir alguna direccion para generar el reporte');", true);
            }
            else
            {
                SqlConnection cn = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
                SqlDataAdapter da = new SqlDataAdapter("select IdSala, Nombre, Direccion, Telefono, FechaRegistro from SALA_VENTA WHERE Direccion =  '" + txtDireccion.Text + "'", cn);
                DataTable dt = new DataTable("table1");
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    ReporteSalaVentas.Visible = true;
                    ReporteSalaVentas.ProcessingMode = ProcessingMode.Local;
                    ReporteSalaVentas.LocalReport.ReportPath = Server.MapPath("ReporteSalaVentas.rdlc");
                    ReporteSalaVentas.LocalReport.DataSources.Clear();
                    ReporteSalaVentas.LocalReport.DataSources.Add(new ReportDataSource("dsSalaVentas", dt));
                    ReporteSalaVentas.LocalReport.Refresh();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se encontraron Registros');", true);

                }

            }

        }

    }
}