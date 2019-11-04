using System;
using System.Collections.Generic;
using System.Configuration;
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
		string insertcmd = "insert into Products(pNAME,pIMG,pDESCRIBE,pDETAILS,pPRICE,pCLASSID,pTIME) values(@pNAME,@pIMG,@pDESCRIBE,@pDETAILS,@pPRICE,@pCLASSID,@pTIME)";
		SqlCommand mycmd = new SqlCommand(insertcmd, products);


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
		lblMsg.Text = "添加成功！";

	}


	protected void btnAddclass_Click(object sender, EventArgs e)
	{
		Response.Redirect("addPClass.aspx");
	}
}