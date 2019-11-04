using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_selectProducts : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["selectCmd"] != null)
			SqlDataSource2.SelectCommand = Session["selectCmd"].ToString();

	}

	//删除记录
	protected void Button_Delete(object sender, CommandEventArgs e)
	{
		string deleteStr2 = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(deleteStr2);

		String cmd = "delete from Products where pID=@deleteID";
		SqlCommand mycmd = new SqlCommand(cmd, connection);
		mycmd.Parameters.AddWithValue("@deleteID", e.CommandArgument);
		mycmd.Connection = connection;
		mycmd.Connection.Open();
		try
		{
			mycmd.ExecuteNonQuery();
			//string strcmd = Session["selectCmd"].ToString();
			if (Session["selectCmd"] != null)//如果此session非空
				SqlDataSource2.SelectCommand = Session["selectCmd"].ToString();
		}
		catch (Exception ee)
		{            //Response.Write(ee.Message);
			RegisterStartupScript("key1", "<script>alert('无法删除！')</script>");
			return;
		}
		mycmd.Connection.Close();
		//Response.Write("<script>alert('删除成功!')</script>");
		Response.Redirect("selectProducts.aspx");

	}
	//修改记录
	protected void Button_Update(object sender, CommandEventArgs e)
	{

	}
	//批量删除记录
	protected void Button_BatchDelete(object sender, CommandEventArgs e)
	{
		string deleteStr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(deleteStr);
		connection.Open();
		for (int i = 0; i < ListView1.Items.Count; i++)
		{
			CheckBox chk1 = ListView1.Items[i].FindControl("CheckBox1") as CheckBox;
			if (chk1.Checked)
			{
				string deleteID = (ListView1.Items[i].FindControl("pIDLabel") as Label).Text;
				String cmd = "delete from Products where pID=@deleteID";
				SqlCommand mycmd = new SqlCommand(cmd, connection);
				mycmd.Connection = connection;
				mycmd.Parameters.AddWithValue("@deleteID", deleteID);
				try
				{
					mycmd.ExecuteNonQuery();
				}
				catch (Exception ee)
				{
					Response.Write(ee.Message);
					return;
				}
			}
		}
		Response.Redirect("selectProducts.aspx");


	}



	protected void btnSearch_Click(object sender, EventArgs e)
	{
		string cmd1;
		if (txtSelectValue.Text.Trim().Length == 0)//没有输入关键字，则
		{
			if (ddlClass.SelectedValue == "0")//选择了所有类别，则查所有商品
				cmd1 = "SELECT [pID], [pNAME], [pIMG], [pPRICE], [pCLASSID], [pTIME] FROM [Products]";
			else//选择了某一类别，则查该类别的所有商品
				cmd1 = "SELECT [pID], [pNAME], [pIMG], [pPRICE], [pCLASSID], [pTIME] FROM [Products] where pCLASSID=" + ddlClass.SelectedValue;
		}
		else//输入了关键字，则
		{
			if (ddlClass.SelectedValue == "0")//选择了所有类别，则在所有商品中查商品名包含该关键字的商品
				cmd1 = "SELECT [pID], [pNAME], [pIMG], [pPRICE], [pCLASSID], [pTIME] FROM [Products] where pNAME like '%" + txtSelectValue.Text.Trim() + "%'";
			else//选择了某一类别，则在该类别中查商品名包含该关键字的商品
				cmd1 = "SELECT [pID], [pNAME], [pIMG], [pPRICE], [pCLASSID], [pTIME] FROM [Products] where pCLASSID=" + ddlClass.SelectedValue + " and pNAME like '%" + txtSelectValue.Text.Trim() + "%'";
		}
		//Response.Write(strcmd);
		Session["selectCmd"] = cmd1;
		SqlDataSource2.SelectCommand = Session["selectCmd"].ToString();
	}

	protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
	{
		DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
		if (Session["selectCmd"] != null)
			SqlDataSource2.SelectCommand = Session["selectCmd"].ToString();

	}
	protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
	{
		if (e.Item.ItemType == ListViewItemType.DataItem)
		{
			// string str=(e.Item.FindControl("newsTitleLabel") as Label).Text;
			// LinkButton b = e.Item.FindControl("LinkButton6") as LinkButton;
			(e.Item.FindControl("LinkButtonDelete") as LinkButton).Attributes.Add
				("onclick", "javascript:return confirm('你确认要删除：\""
				+ (e.Item.FindControl("pIDLabel") as Label).Text + "\"号记录吗?')");
		}

	}

}