using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_userMasterPage3 : System.Web.UI.MasterPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["username1"] == null)
		{
			Page.RegisterStartupScript("kk", "<script>alert('请先登录');window.location.href='Login.aspx?url=" + Request.RawUrl + "';</script>");
			return;
		}

	}
}
