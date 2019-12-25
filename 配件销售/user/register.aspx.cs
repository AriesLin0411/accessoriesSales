using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class register : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		
	}
	protected void txtUsername_TextChanged(object sender, EventArgs e)
	{
		if (isUnameExisted(txtUsername.Text.Trim()))
		{
			Label1.Text = "该会员名已存在，请换一个。";
		}
		else
		{
			Label1.Text = "恭喜，该会员名可用。";
		}

	}
	protected bool isUnameExisted(string uname)
	{
		string cnnstr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(cnnstr);
		string queryString = "select top 1 * from Users where username=@uname";
		SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);
		adapter.SelectCommand.Parameters.AddWithValue("@uname", uname);
		DataSet ds = new DataSet();
		adapter.Fill(ds);//填充数据集
		if (ds.Tables[0].Rows.Count > 0)//数据集第一张表中有数据吗？
		{//有，用户名已存在返回true
			return true;
		}
		else
		{
			return false;
		}
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