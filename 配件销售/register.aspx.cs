using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class register : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		
	}
	protected void btnSubmit_Click(object sender,EventArgs e)
	{
		string connectionString = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(connectionString);
		connection.Open();
		string insertcmd = "insert into Users(username,password,phonenumber,sex,address,email)values(@username,@password,@phonenumber,@sex,@address,@email)";
		SqlCommand mycmd = new SqlCommand(insertcmd, connection);
		string sex = "";
		if (rdbMale.Checked)
			sex = "男";
		else
			sex = "女";
		if (txtPassword.Text != txtConfirmpassword.Text)
			Response.Write("<script>alert('两次输入密码不相等')</script>");
		mycmd.Parameters.AddWithValue("@username",txtUsername.Text.Trim());
		mycmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
		mycmd.Parameters.AddWithValue("@phonenumber", txtPhonenumber.Text.Trim());
		mycmd.Parameters.AddWithValue("@sex", sex);
		mycmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());
		mycmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
		int result = 0;
		try {
			result = mycmd.ExecuteNonQuery(); }
		catch(Exception ee)
		{
			Response.Write(ee.Message);
			return;
		}
		mycmd.Connection.Close();
		Session["username"] = txtUsername.Text.Trim();
		Response.Write("注册成功");
	}
}