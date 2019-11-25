using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_showShopcar : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			ListView1.DataBind();//重新绑定listview1
			compTotalPrice();//计算总价
		}
		Response.Expires = -1;
		Response.CacheControl = "no-cache";//禁止缓存

	}
	protected void txtNum_TextChanged(object sender, EventArgs e)
	{
		TextBox tb = (TextBox)sender;
		ListViewDataItem item = tb.NamingContainer as ListViewDataItem;//找到输入文本框所在行
		Label lbl = item.FindControl("lblPid") as Label; //找到id为lblPid的label 用于存储pid字段的

		string uname = Session["username1"].ToString();
		int pid = int.Parse(lbl.Text);
		int num = int.Parse(tb.Text);
		updateProductNum(uname, pid, num);//修改数量
										  //Response.Write(tb.Text + ".." + lbl.Text);  
		ListView1.DataBind();//重新绑定listview1
		compTotalPrice();//计算总价
	}
	protected void Button_Delete(object sender, CommandEventArgs e)
	{
		string username = Session["username1"].ToString();
		int pid = int.Parse(e.CommandArgument.ToString());
		deleteProduct(username, pid);
		ListView1.DataBind();//重新绑定listview1
		compTotalPrice();//计算总价
	}

	protected void btnSubmit_Click(object sender, EventArgs e)
	{
		if (lblPrice.Text.Trim() == "0")
		{
			Page.RegisterStartupScript("kk", "<script>alert('您的购物车为空')</script>");
			return;
		}
		string username = Session["username1"].ToString();
		string orderId = createId(username);
		createOrder(orderId,username);


	}
	protected void compTotalPrice()
	{
		double sum = 0;
		Label lblPrice1;
		for (int i = 0; i < ListView1.Items.Count; i++)
		{
			lblPrice1 = ListView1.Items[i].FindControl("totalPriceLabel") as Label;
			sum += double.Parse(lblPrice1.Text);
		}
		lblPrice.Text = sum.ToString();
	}
	protected void updateProductNum(string uname, int pid, int num)//顾客名，商品编号,数量
	{
		//创建连接对象
		string cnnstr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(cnnstr);

		string cmdstr = "update shopCar set num=@num where username=@username and pID=@pID";
		SqlCommand sqlcmd = new SqlCommand(cmdstr, connection);
		sqlcmd.Parameters.AddWithValue("@username", uname);
		sqlcmd.Parameters.AddWithValue("@pID", pid);
		sqlcmd.Parameters.AddWithValue("@num", num);
		connection.Open();
		try
		{
			sqlcmd.ExecuteNonQuery();
			//Page.RegisterStartupScript("kk", "<script>alert('已加入购物车')</script>");
		}
		catch (Exception ex)
		{
			Page.RegisterStartupScript("kk", "<script>alert('出错')</script>");
			return;
		}
		//Response.Redirect("showcart.aspx");
		connection.Close();
	}
	protected void deleteProduct(string username, int pID)
	{
		string cnnstr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(cnnstr);
		string cmdstr = "delete from shopCar where username=@username and pID=@pID";
		SqlCommand sqlcmd = new SqlCommand(cmdstr, connection);
		sqlcmd.Parameters.AddWithValue("@username", username);
		sqlcmd.Parameters.AddWithValue("@pID", pID);
		connection.Open();
		try
		{
			sqlcmd.ExecuteNonQuery();
			//Page.RegisterStartupScript("kk", "<script>alert('已加入购物车')</script>");
		}
		catch (Exception ex)
		{
			Page.RegisterStartupScript("kk", "<script>alert('出错')</script>");
			return;
		}
		//Response.Redirect("showcart.aspx");
	}
	protected string createId(string username)
	{
		username = username.Trim();
		string datetime=DateTime.Now.ToString("yyyyMMddHHmmss");
		return username + datetime;
	}
	protected void createOrder(string oderId,string username)
	{
		string createStr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(createStr);
		string sqlString = "insert into orders(orderId,userName,datetime,totalPrice,status)values(@orderId,@userName,@datetime,@totalPrice,@status)";
		SqlCommand createCmd = new SqlCommand(sqlString, connection);
		createCmd.Parameters.AddWithValue("@userName", username);
		createCmd.Parameters.AddWithValue("@oderId", oderId);
		createCmd.Parameters.AddWithValue("@datetime", DateTime.Now.ToString());
		createCmd.Parameters.AddWithValue("totalPrice", lblPrice.Text);
		createCmd.Parameters.AddWithValue("@status", "未付款");
		SqlTransaction tran = null;
		try
		{
			connection.Open();
			tran = connection.BeginTransaction();
			createCmd.Transaction = tran;
			createCmd.ExecuteNonQuery();
			sqlString = "insert into orderDetails(orderId,pID,number,totalPrice)values(@orderId,@pID,@number,@totalPrice)";
			createCmd.CommandText = sqlString;
			Label lblPric, lblId;
			TextBox txtNum;
			for(int i = 0; i < ListView1.Items.Count; i++)
			{
				lblPric = ListView1.Items[i].FindControl("totalPriceLabel") as Label;
				lblId = ListView1.Items[i].FindControl("pidLabel") as Label;
				txtNum = ListView1.Items[i].FindControl("txtNum") as TextBox;
				createCmd.Parameters.Clear();
				createCmd.Parameters.AddWithValue("@pID",lblId.Text);
				createCmd.Parameters.AddWithValue("@oderId",oderId);
				createCmd.Parameters.AddWithValue("@number",txtNum.Text);
				createCmd.Parameters.AddWithValue("@totalPrice",lblPrice.Text);
				createCmd.ExecuteNonQuery();
			}
			createCmd.CommandText = "delete from shopCar where username='" + username + "'";
			createCmd.ExecuteNonQuery();
			tran.Commit();
			Response.Redirect("showOrders.aspx");

		}
		catch(Exception ee)
		{
			tran.Rollback();
			Response.Write(ee.Message);
		}
		finally
		{   
			if (connection.State == System.Data.ConnectionState.Open)
			{
				connection.Close();
			}
		}

	}
}