using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)//首次打开页面
		{
			if (Request.Cookies["username"] != null)
				txtName.Text = Request.Cookies["username"].Value;
			if (Request.Cookies["password"] != null)
				txtPassword.Attributes.Add("value", Request.Cookies["password"].Value);
			CheckBox1.Checked = true;
		}
	}protected void btnLogin_Click(object sender, EventArgs e)
		{
			//检查验证码是否正确
			if (Session["checkcode"] == null || txtCheckcode.Text.Trim().ToUpper() != Session["checkcode"].ToString())
			{
				Page.RegisterStartupScript("k1", "<script>alert('验证码错误！')</script>");
				txtCheckcode.Text = "";
				return;
			}

			//创建连接对象
			string cnnstr = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
			SqlConnection connection = new SqlConnection(cnnstr);
			//要执行的查询命令top 1
			string queryString = "select * from admin where adminName=@username and adminPassword=@password";
			//定义创建数据适配器
			SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);
			//设置SQL命令参数        
			adapter.SelectCommand.Parameters.AddWithValue("@username", txtName.Text.Trim());
			adapter.SelectCommand.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
			//定义数据集
			DataSet ds2 = new DataSet();
			adapter.Fill(ds2, "list");//填充数据集
		
			if (ds2.Tables[0].Rows.Count > 0)//数据集第一张表中有数据吗？
			{//有，用户名密码正确
			 //用session记录下用户名
				Session["username"] = ds2.Tables[0].Rows[0].ItemArray[0].ToString();
				Session["password"] = ds2.Tables[0].Rows[0].ItemArray[1].ToString();
				//如果选择了“记住我”则写cookies到浏览器端
				if (CheckBox1.Checked)
				{
					Response.Cookies["username"].Value = txtName.Text.Trim();
					Response.Cookies["username"].Expires = DateTime.Now.AddDays(7);
					Response.Cookies["password"].Value = txtPassword.Text.Trim();
					Response.Cookies["password"].Expires = DateTime.Now.AddDays(7);
				}
				//如果打开login.aspx页面时传递来原页面的url,则登录后转到该url指定页面
				if (Request.QueryString["url"] != null)
				{
					Response.Redirect(Request.QueryString["url"].ToString());
				}
				else//否则转向首页
				{
					Response.Redirect("/admin/default.aspx");
				}
			}
			else
			{//没有，用户名密码错误
				Page.RegisterStartupScript("k1", "<script>alert('用户名或密码错误！')</script>");
				txtName.Text = "";
				txtPassword.Text = "";
				return;
			}
		}
}