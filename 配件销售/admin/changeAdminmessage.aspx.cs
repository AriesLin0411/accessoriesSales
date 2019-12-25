using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_changeUsermessage : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void btnSearch_Click(object sender, EventArgs e)
	{
		string cnnstr1 = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection1 = new SqlConnection(cnnstr1);
		string cmdstr1 = "select * from admin where adminName=N'" + txtCarnum.Text.ToString().Trim() + "'";
		SqlCommand sqlcmd1 = new SqlCommand(cmdstr1, connection1);
		connection1.Open();
		SqlDataReader dr1 = sqlcmd1.ExecuteReader();
		if (dr1.Read())
		{

			TextBox1.Text = dr1["adminName"].ToString().Trim();
			TextBox2.Text = dr1["adminSex"].ToString().Trim();
			TextBox4.Text = dr1["adminEmail"].ToString().Trim();
			TextBox5.Text = dr1["adminPhonenumber"].ToString().Trim();
		}

	}

	protected void btnChange_Click(object sender, EventArgs e)
	{
		string cnnstr3 = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection3 = new SqlConnection(cnnstr3);
		string cmdstr3 = "update admin set adminSex=@prc1,adminEmail=@prc3,adminPhonenumber=@prc4 where adminName='" + txtCarnum.Text.ToString().Trim() + "'";
		SqlCommand sqlcmd3 = new SqlCommand(cmdstr3, connection3);
		connection3.Open();
		sqlcmd3.Parameters.AddWithValue("@prc1", TextBox2.Text);
		sqlcmd3.Parameters.AddWithValue("@prc3", TextBox4.Text);
		sqlcmd3.Parameters.AddWithValue("@prc4", TextBox5.Text);
		int iResult = 0;
		try
		{
			iResult = sqlcmd3.ExecuteNonQuery();
		}
		catch (Exception ee)
		{
			Response.Write(ee.Message);
			return;
		}
		sqlcmd3.Connection.Close();
	}
}