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
    public partial class ReporteKardexFamiliar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCategoria.Text = String.IsNullOrEmpty(Request.QueryString["nombre"]) ? "" : Request.QueryString["nombre"].ToString();
            
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ObtenerInfo();
            //ReportKardexFamiliar.Visible = true;
        }


        public void ObtenerInfo()
        {
            if (string.IsNullOrEmpty(txtCategoria.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Debe escribir alguna categoria para Generar el reporte');", true);
            }
            else
            {

                SqlConnection cn = new SqlConnection(@"Data Source=(local);Initial Catalog=DBPROYECTO;Integrated Security=True");
                SqlDataAdapter da = new SqlDataAdapter("select idKardexFamiliar, FechaRegistro, detalle, producto, categoria_familia, cantidad_entradas, valorUnitario_entradas, total_entrada, cantidad_salidas, valorUnitario_salidas, total_salidas, cantidad_saldos, valorUnitario_saldos, total_saldos from KARDEX_FAMILIAR WHERE categoria_familia =  '" + txtCategoria.Text + "'", cn);
                DataTable dt = new DataTable("table1");
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    ReportKardexFamiliar.Visible = true;

                    ReportKardexFamiliar.ProcessingMode = ProcessingMode.Local;
                    ReportKardexFamiliar.LocalReport.ReportPath = Server.MapPath("ReporteKardexFamiliar.rdlc");
                    ReportKardexFamiliar.LocalReport.DataSources.Clear();
                    ReportKardexFamiliar.LocalReport.DataSources.Add(new ReportDataSource("dsKardexFamiliar", dt));
                    ReportKardexFamiliar.LocalReport.Refresh();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se encontraron Registros');", true);

                }

            }

        }

        
    }
}