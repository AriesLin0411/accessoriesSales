using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_generateTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet1TableAdapters.ordersTableAdapter a = new DataSet1TableAdapters.ordersTableAdapter();
            DataSet1.ordersDataTable tb1 = new DataSet1.ordersDataTable();
            a.Fill(tb1);
            ReportDataSource rds = new ReportDataSource();
            rds.Name = "DataSet1";
            rds.Value = tb1;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}