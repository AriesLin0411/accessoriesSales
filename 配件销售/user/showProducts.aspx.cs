using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_showProducts : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void Button_Command(object sender, CommandEventArgs e)
	{
		Button btn = (Button)sender;
		ListViewDataItem item = btn.NamingContainer as ListViewDataItem;
		TextBox tb = item.FindControl("txtNum") as TextBox;
		int num = int.Parse(tb.Text);
		if (num < 0)
		{
			num = 1;
		}
		if (e.CommandArgument == null)
		{
			Page.RegisterStartupScript("kk", "<script>alert('参数不正确!')</script>");
			return;
		}
		if (Session["username1"] == null)
		{
			Page.RegisterStartupScript("kk", "<script>alert('请先登录!');window.location.href='Login.aspx?url="+Request.RawUrl+"';</script>");
			return;
		}
		string username = Session["username1"].ToString();
		string pIDstr = e.CommandArgument.ToString();
		int pID;
		int.TryParse(pIDstr, out pID);
		if (shopping.haveProducts(username, pID))
		{
			try
			{
				shopping.addProductsnum(username, pID, num);
				Page.RegisterStartupScript("kk", "<script>alert('已加入购物车!')</script>");
			}
			catch(Exception ee)
			{
				Page.RegisterStartupScript("kk", "<script>alert('错误')</script>");
				return;
			}
		}
		else
		{
			try
			{
				shopping.addNewproducts(username, pID, num);
				Page.RegisterStartupScript("kk", "<script>alert('已加入购物车!')</script>");
			}
			catch(Exception ee)
			{
				
				Page.RegisterStartupScript("kk", "<script>alert('错误')</script>");
				return;
			}
		}
	}
}