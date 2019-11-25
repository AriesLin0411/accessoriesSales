using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// shopping 的摘要说明
/// </summary>
public class shopping
{
	public shopping()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

	//查询某用户表中是否存在某商品
	public static bool haveProducts(string username,int pID)
	{
		string selectStr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection sele = new SqlConnection(selectStr);
		string find = "select * from shopCar where username=@username and pID=@pID";
		SqlDataAdapter adapter = new SqlDataAdapter(find, sele);
		adapter.SelectCommand.Parameters.AddWithValue("@username", username);
		adapter.SelectCommand.Parameters.AddWithValue("@pID", pID);
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		if (ds.Tables[0].Rows.Count > 0)
		{
			return true;
		}
		else
			return false;
	}

	//增加新商品到购物车
	public static void addNewproducts(string username,int pID,int num)
	{
		string addStr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection ad = new SqlConnection(addStr);
		string add = "insert into shopCar (username,pID,num)values(@username,@pID,@num)";
		SqlCommand mycmd = new SqlCommand(add, ad);
		mycmd.Parameters.AddWithValue("@username",username);
		mycmd.Parameters.AddWithValue("@pID", pID);
		mycmd.Parameters.AddWithValue("@num", num);
		mycmd.Connection.Open();
		try
		{
			mycmd.ExecuteNonQuery();
		}
		catch(Exception l)
		{
			throw new Exception(l.Message);
		}
		finally
		{
			mycmd.Connection.Close();
		}

	}

	//添加已有商品数量
	public static void addProductsnum(string username,int pID,int num)
	{
		string addStr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection ad = new SqlConnection(addStr);
		string add = "update shopCar set num=num+@num where username=@username and pID=@pID";
		SqlCommand mycmd = new SqlCommand(add, ad);
		mycmd.Parameters.AddWithValue("@username", username);
		mycmd.Parameters.AddWithValue("@pID", pID);
		mycmd.Parameters.AddWithValue("@num", num);
		mycmd.Connection.Open();
		try
		{
			mycmd.ExecuteNonQuery();
		}
		catch(Exception l)
		{
			throw new Exception(l.Message);
		}
		finally
		{
			mycmd.Connection.Close();
		}
	}
}