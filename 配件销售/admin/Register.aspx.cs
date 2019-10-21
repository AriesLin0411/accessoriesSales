using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Register : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void btnSubmit_Click(object sender, EventArgs e)
	{
		string connectionString2 = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection2 = new SqlConnection(connectionString2);
		connection2.Open();
		string insertcmd2 = "insert into admin(adminName,adminPassword,adminPhonenumber,adminSex,adminEmail)values(@adminName,@adminPassword,@adminPhonenumber,@adminSex,@adminEmail)";
		SqlCommand mycmd2 = new SqlCommand(insertcmd2, connection2);
		string sex = "";
		if (rdbMale.Checked)
			sex = "男";
		else
			sex = "女";
		if (txtPassword.Text != txtConfirmpassword.Text)
			Response.Write("<script>alert('两次输入密码不相等')</script>");
		mycmd2.Parameters.AddWithValue("@adminName", txtUsername.Text.Trim());
		mycmd2.Parameters.AddWithValue("@adminPassword", txtPassword.Text.Trim());
		mycmd2.Parameters.AddWithValue("@adminPhonenumber", txtPhonenumber.Text.Trim());
		mycmd2.Parameters.AddWithValue("@adminSex", sex);
		mycmd2.Parameters.AddWithValue("@adminEmail", txtEmail.Text.Trim());
		int result = 0;
		try
		{
			result = mycmd2.ExecuteNonQuery();
		}
		catch (Exception ee)
		{
			Response.Write(ee.Message);
			return;
		}
		mycmd2.Connection.Close();
		Session["username"] = txtUsername.Text.Trim();
		Response.Write("注册成功");
	}
	protected void btnReset_Click(object sender, EventArgs e)
	{
		this.FindButton(this);
	}
	private void FindButton(Control c)
	{
		if (c.Controls != null)
		{

			foreach (Control x in c.Controls)
			{
				if (x is System.Web.UI.WebControls.TextBox)
				{
					((System.Web.UI.WebControls.TextBox)x).Text = "";
				}
				FindButton(x);
			}
		}
	}
}