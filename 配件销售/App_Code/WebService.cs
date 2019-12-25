using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// WebService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

	public WebService()
	{

		//如果使用设计的组件，请取消注释以下行 
		//InitializeComponent(); 
	}

	[WebMethod]
	public string HelloWorld()
	{
		return "Hello World";
	}
	[WebMethod]
	public string IsUnameExisted(string uname)
	{
		string cnnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		SqlConnection connection = new SqlConnection(cnnstr);
		string queryString = "select top 1 * from Users where username=@uname";
		SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);
		adapter.SelectCommand.Parameters.AddWithValue("@uname", uname);
		DataSet ds = new DataSet();
		adapter.Fill(ds);//填充数据集
		if (ds.Tables[0].Rows.Count > 0)//数据集第一张表中有数据吗？
		{//有，用户名已存在返回yes
			return "yes";
		}
		else
		{ return "no"; }
	}

}
