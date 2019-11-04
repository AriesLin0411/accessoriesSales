using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addPClass : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnAdd_Click(object sender, EventArgs e)
	{
		string classString = ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
		SqlConnection Class = new SqlConnection(classString);
		string insertcmd = "insert into Class(cName) values(@cName)";
		SqlCommand mycmd = new SqlCommand(insertcmd,Class);
		mycmd.Parameters.AddWithValue("@cName", txtPClass.Text.Trim()); 
		mycmd.Connection.Open(); 
        int iResult = 0;
		iResult = mycmd.ExecuteNonQuery();
		mycmd.Connection.Close();
		lblMsg.Text = "添加成功！";
	}
}