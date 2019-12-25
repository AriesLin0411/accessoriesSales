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
		string cmdstr1 = "select * from Users where id=N'" + txtCarnum.Text.ToString().Trim() + "'";
		SqlCommand sqlcmd1 = new SqlCommand(cmdstr1, connection1);
		connection1.Open();
		SqlDataReader dr1 = sqlcmd1.ExecuteReader();
		if (dr1.Read())
		{

			TextBox1.Text = dr1["id"].ToString().Trim();
			TextBox2.Text = dr1["sex"].ToString().Trim();
			TextBox3.Text = dr1["address"].ToString().Trim();
			TextBox4.Text = dr1["email"].ToString().Trim();
			TextBox5.Text = dr1["phonenumber"].ToString().Trim();
		}

	}

	protected void btnChange_Click(object sender, EventArgs e)
	{
		string cnnstr3 = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection3 = new SqlConnection(cnnstr3);
		string cmdstr3 = "update Users set sex=@prc1,address=@prc2,email=@prc3,phonenumber=@prc4 where id='" + txtCarnum.Text.ToString().Trim() + "'";
		SqlCommand sqlcmd3 = new SqlCommand(cmdstr3, connection3);
		connection3.Open();
		sqlcmd3.Parameters.AddWithValue("@prc1", TextBox2.Text);
		sqlcmd3.Parameters.AddWithValue("@prc2", TextBox3.Text);
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