using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addUser : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnChange_Click(object sender, EventArgs e)
	{
		string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(connectionString);
		connection.Open();
		string insertcmd = "insert into Users(username,password,id,sex)values(@username,@password,@id,@sex)";
		SqlCommand mycmd = new SqlCommand(insertcmd, connection);
		mycmd.Parameters.AddWithValue("@username", TextBox1.Text.Trim());
		mycmd.Parameters.AddWithValue("@password", TextBox2.Text.Trim());
		mycmd.Parameters.AddWithValue("@id", TextBox4.Text.Trim());
		mycmd.Parameters.AddWithValue("@sex", TextBox3.Text.Trim());
		int result = 0;
		try
		{
			result = mycmd.ExecuteNonQuery();
		}
		catch (Exception ee)
		{
			Response.Write(ee.Message);
			return;
		}
	}
}