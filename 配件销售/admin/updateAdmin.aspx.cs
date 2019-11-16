using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_updateProducts : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			getData();
		}
	}

	private void getData()
	{
		if (Request.QueryString["name"] == null)
		{
			Page.RegisterStartupScript("k1", "<script>alert('缺少参数！');</script>");
			Response.End();
		}
		//查询商品
		string selectStr1 = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection1 = new SqlConnection(selectStr1);
		string selectCmd1 = "select * from admin where adminName ='"+Request.QueryString["name"]+"'";
		SqlDataAdapter da1 = new SqlDataAdapter(selectCmd1, connection1);
		DataSet ds1 = new DataSet();
		da1.Fill(ds1);
		//显示商品信息
		if (ds1.Tables[0].Rows.Count > 0)
		{
			txtName.Text = ds1.Tables[0].Rows[0].ItemArray[0].ToString();     
			txtSex.Text = ds1.Tables[0].Rows[0].ItemArray[1].ToString();      
			txtPassword .Text = ds1.Tables[0].Rows[0].ItemArray[2].ToString();      
			txtPhonenumber.Text = ds1.Tables[0].Rows[0].ItemArray[3].ToString();
			txtEmail.Text = ds1.Tables[0].Rows[0].ItemArray[4].ToString();
		}
	}
	protected void btnSubmmit_Click(object sender, EventArgs e)
	{
		string productsString = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection products = new SqlConnection(productsString);
		string insertcmd = "update admin set adminName=@adminName,adminSex=@adminSex,adminPassword=@adminPassword,adminPhonenumber=@adminPhonenumber,adminEmail=@adminEmail where adminName=@adminName";
		SqlCommand mycmd = new SqlCommand(insertcmd, products);

		mycmd.Parameters.AddWithValue("@adminName", txtName.Text.Trim());
		mycmd.Parameters.AddWithValue("@adminSex", txtSex.Text.Trim());
		mycmd.Parameters.AddWithValue("@adminPassword", txtPassword.Text.Trim());
		mycmd.Parameters.AddWithValue("@adminPhonenumber", txtPhonenumber.Text.Trim());
		mycmd.Parameters.AddWithValue("@adminEmail", txtEmail.Text.Trim());
		mycmd.Connection.Open(); //connection.Open();
		int iResult = 0;
		try
		{
			iResult = mycmd.ExecuteNonQuery();
		}
		catch (Exception ee)
		{
			Response.Write(ee.Message);
			return;
		}
		mycmd.Connection.Close();
		lblMsg.Text = "修改成功！";

	}


}