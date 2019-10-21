using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class successLogin : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["username"] != null)
		{
			Response.Write("<h2>你好，" + Session["username"].ToString() + "</h2>");
		}
	}
}