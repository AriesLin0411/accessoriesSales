using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_showOrders : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	//付款
	protected void Button_Pay(object sender, CommandEventArgs e)
	{
		string orderId = e.CommandArgument.ToString();//要付款的订单号
		string username = Session["username1"].ToString();//用户名
												   //付款操作的代码写在这里，
												   //在此以下代码仅是进行测试
		if (Payment(username, orderId))//付款成功
		{
			Page.RegisterStartupScript("kk", "<script>alert('ok');</script>");
		}
		else
		{
			Page.RegisterStartupScript("kk", "<script>alert('not ok');</script>");
		}
		ListView1.DataBind();//重新绑定listview1
	}
	//付款函数
	private bool Payment(string uname, string orderid)
	{
		bool successflag = false;
		/***********************/
		/*  付款的代码写在此   */
		/**********************/
		//付款成功后修改订单状态
		successflag = updateOrderState(orderid, "已付款");
		return successflag;
	}
	//修改订单状态
	private bool updateOrderState(string orderid, string orderstate)
	{
		//创建连接对象
		bool successFlag = false;
		string changeStr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(changeStr);
		string changeString = "update orders set status=@status where orderId=@orderId";
		SqlCommand changeCmd = new SqlCommand(changeString, connection);
		changeCmd.Parameters.AddWithValue("@orderId", orderid);
		changeCmd.Parameters.AddWithValue("@status", orderstate);
		try
		{
			connection.Open();
			changeCmd.ExecuteNonQuery();
			successFlag = true;
		}
		catch (Exception ex)//出错时
		{
			successFlag = false;
			//Response.Write(ex.Message);
		}
		finally
		{   //如果连接打开，则关闭连接
			if (connection.State == System.Data.ConnectionState.Open)
			{ connection.Close(); }
		}
		return successFlag;
	}
	//确认收货
	protected void Button_Receive(object sender, CommandEventArgs e)
	{
		string orderId = e.CommandArgument.ToString();//订单号
		string username = Session["username1"].ToString();//用户名
												   //付款操作的代码写在这里，
												   //在此以下代码仅是进行测试
		if (updateOrderState(orderId, "待评价"))//修改订单状态为 待评价
		{
			Page.RegisterStartupScript("kk", "<script>alert('收货ok');</script>");
		}
		else
		{
			Page.RegisterStartupScript("kk", "<script>alert('收货 not ok');</script>");
		}
		ListView1.DataBind();//重新绑定listview1
	}
	//评价
	protected void Button_Comment(object sender, CommandEventArgs e)
	{
		string orderId = e.CommandArgument.ToString();//订单号
		string username = Session["username1"].ToString();//用户名
												   //一般要转向另一页面进行评价，在此仅模拟评价完成后修改订单状态的过程，
												   //在此以下代码仅是进行测试
		if (updateOrderState(orderId, "交易完成"))//修改订单状态为 交易完成
		{
			Page.RegisterStartupScript("kk", "<script>alert('交易完成ok');</script>");
		}
		else
		{
			Page.RegisterStartupScript("kk", "<script>alert('交易完成 not ok');</script>");
		}
		ListView1.DataBind();//重新绑定listview1
	}

}