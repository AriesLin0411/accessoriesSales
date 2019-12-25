using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_pj : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void Button1_Click(object sender, EventArgs e)
	{
		string changeStr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(changeStr);
		string changeString = "insert into pj (orderid,sp,wl,fw,txt)values(@orderid,@sp,@wl,@fw,@txt)";
		SqlCommand changeCmd = new SqlCommand(changeString, connection);
		changeCmd.Parameters.AddWithValue("@orderid", Request.QueryString["id"]);
		changeCmd.Parameters.AddWithValue("@sp", DropDownList1.SelectedValue);
		changeCmd.Parameters.AddWithValue("@wl", DropDownList1.SelectedValue);
		changeCmd.Parameters.AddWithValue("@fw", DropDownList1.SelectedValue);
		changeCmd.Parameters.AddWithValue("@txt", TextBox1.Text);
		try
		{
			connection.Open();
			changeCmd.ExecuteNonQuery();
			Response.Redirect("showOrders.aspx");
		}
		catch(Exception ex)
		{
			Response.Write(ex.Message);
		}
	}
}