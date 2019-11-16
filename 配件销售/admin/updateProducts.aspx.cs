using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_updateProducts : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			bindData();
			getData();
		}
	}

	private void getData()
	{
		if (Request.QueryString["id"] == null)
		{
			Page.RegisterStartupScript("k1", "<script>alert('缺少参数！');</script>");
			Response.End();
		}
		//查询商品
		string selectStr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(selectStr);
		string selectCmd = "select * from Products where pID=" + Request.QueryString["id"];
		SqlDataAdapter da = new SqlDataAdapter(selectCmd, connection);
		DataSet ds = new DataSet();
		da.Fill(ds);
		//显示商品信息
		if (ds.Tables[0].Rows.Count > 0)
		{
			txtId.Text = ds.Tables[0].Rows[0].ItemArray[0].ToString();//商品号            
			txtName.Text = ds.Tables[0].Rows[0].ItemArray[1].ToString();//商品名            
			ddlImg.SelectedValue = ds.Tables[0].Rows[0].ItemArray[2].ToString();//图片            
			Img1.ImageUrl = ddlImg.SelectedValue;//显示图片
			txtDescribe.Text = ds.Tables[0].Rows[0].ItemArray[3].ToString();//简介            
			CKEditor1.Text = ds.Tables[0].Rows[0].ItemArray[6].ToString();//详细介绍            
			txtPrice.Text = ds.Tables[0].Rows[0].ItemArray[4].ToString();//价格
			ddlClass.SelectedValue = ds.Tables[0].Rows[0].ItemArray[5].ToString();//类别
			txtTime.Text = ds.Tables[0].Rows[0].ItemArray[7].ToString();//时间    
		}
	}

	protected void imgbtnCalendar_Click(object sender, ImageClickEventArgs e)
	{
		Calendar1.Visible = !Calendar1.Visible;
	}

	protected void Calendar1_SelectionChanged(object sender, EventArgs e)
	{
		txtTime.Text = Calendar1.SelectedDate.ToString();
		Calendar1.Visible = false;
	}
	protected void bindData()
	{
		string str = Server.MapPath(Request.ApplicationPath) + "\\images\\Upload";
		string[] strFiles = System.IO.Directory.GetFiles(str);
		ddlImg.Items.Clear();

		for (int i = 0; i < strFiles.Length; i++)
		{
			ListItem item = new ListItem(System.IO.Path.GetFileNameWithoutExtension(strFiles[i]), "~\\images\\Upload\\" + System.IO.Path.GetFileName(strFiles[i]));
			ddlImg.Items.Add(item);
		}
		Img1.ImageUrl = ddlImg.SelectedValue;
	}

	protected void ddlImg_SelectedIndexChanged(object sender, EventArgs e)
	{
		Img1.ImageUrl = ddlImg.SelectedValue;
	}


	protected void btnSubmmit_Click(object sender, EventArgs e)
	{
		string productsString = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection products = new SqlConnection(productsString);
		string insertcmd = "update Products set pNAME=@pNAME,pIMG=@pIMG,pDESCRIBE=@pDESCRIBE,pDETAILS=@pDETAILS,pPRICE=@pPRICE,pCLASSID=@pCLASSID,pTIME=@pTIME where pID=@pID";
		SqlCommand mycmd = new SqlCommand(insertcmd, products);

		mycmd.Parameters.AddWithValue("@pID", txtId.Text.Trim());
		mycmd.Parameters.AddWithValue("@pNAME", txtName.Text.Trim());
		mycmd.Parameters.AddWithValue("@pIMG", ddlImg.SelectedItem.Value);
		mycmd.Parameters.AddWithValue("@pDESCRIBE", txtDescribe.Text.Trim());
		mycmd.Parameters.AddWithValue("@pDETAILS", CKEditor1.Text);
		mycmd.Parameters.AddWithValue("@pPRICE", txtPrice.Text.Trim());
		mycmd.Parameters.AddWithValue("@pCLASSID", ddlClass.SelectedItem.Value);

		if (txtTime.Text.Trim().Length == 0)
			mycmd.Parameters.AddWithValue("@pTIME", DateTime.Now);//取当前日期时间
		else
			mycmd.Parameters.AddWithValue("@pTIME", txtTime.Text.Trim());

		mycmd.Connection.Open(); //connection.Open();
		int iResult = 0;
		try
		{
			iResult = mycmd.ExecuteNonQuery();
		}
		catch (Exception ee)
		{
			Response.Write(ee.Message);
			return;
		}
		mycmd.Connection.Close();
		lblMsg.Text = "修改成功！";

	}


	protected void btnAddclass_Click(object sender, EventArgs e)
	{
		Response.Redirect("addPClass.aspx");
	}
}