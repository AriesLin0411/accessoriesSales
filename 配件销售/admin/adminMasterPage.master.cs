using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminMasterPage : System.Web.UI.MasterPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["username"] == null)
			Response.Redirect("adminLogin.aspx");
		    else
			lblAdmin.Text = "欢迎管理员：" + Session["username"].ToString();

	}

	protected void lkbLogout_Click(object sender, EventArgs e)
	{
		Session["username"] = null;
		Session["password"] = null;
		Response.Redirect("adminLogin.aspx");
	}
}
