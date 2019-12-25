using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_MasterPage : System.Web.UI.MasterPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

		if (Session["username1"] == null)
		{
			lblMsg.Text = "亲,您还没登陆!";
			lkbtnLoginandlogout.Text = "登录";
		}
		else
		{
			lblMsg.Text = Session["username1"] + ",欢迎您!";
			lkbtnLoginandlogout.Text = "退出";
		}
	}
	protected void lkbtnLoginandlogout_Click(object sender, EventArgs e)
	{
		if (lkbtnLoginandlogout.Text == "登录")
		{
			Response.Redirect("Login.aspx");

		}
		else
		{
			Session["username1"] = null;
			Response.Redirect("default.aspx");
		}
	}
	protected void btnSelect_Click(object sender, EventArgs e)
	{
		string ss = txtSelect.Text.ToString().Trim();
		Response.Redirect("selectProducts.aspx?id=" + ss);
	}
}
