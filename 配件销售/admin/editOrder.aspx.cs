using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editOrder : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void Button_Deliver(object sender, CommandEventArgs e)
	{
		string orderid = e.CommandArgument.ToString();
		if (updateOrderState(orderid, "待收货"))
		{
			Page.RegisterStartupScript("kk", "<script>alert('发货成功');</script>");
		}
		else
		{
			Page.RegisterStartupScript("kk", "<script>alert('发货不成功');</script>");
		}
		ListView1.DataBind();
	}
	private bool updateOrderState(string orderid, string orderstate)
	{        
		bool successflag = false;
		string cnnstr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(cnnstr);
		string cmdstr = "update orders set status=@status where orderId=@orderId";
		SqlCommand sqlcmd = new SqlCommand(cmdstr, connection);
		sqlcmd.Parameters.AddWithValue("@orderId", orderid);
		sqlcmd.Parameters.AddWithValue("@status", orderstate);
		try
		{
			connection.Open();
			sqlcmd.ExecuteNonQuery();
			successflag = true;
		}
		catch (Exception ex)//出错时
		{
			successflag = false;
			//Response.Write(ex.Message);
		}
		finally
		{   //如果连接打开，则关闭连接
			if (connection.State == System.Data.ConnectionState.Open)
			{ connection.Close(); }
		}
		return successflag;
	}


}