using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_UploadImg : System.Web.UI.Page
{
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
		Image1.ImageUrl = ddlImg.SelectedValue;
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			bindData();
		}

	}

	protected void ddlImg_SelectedIndexChanged(object sender, EventArgs e)
	{
		Image1.ImageUrl = ddlImg.SelectedValue;
	}
	private static bool IsAllowedExtension(string filename)
	{
		string extension = Path.GetExtension(filename);
		if (extension.ToLower() == ".jpg" || extension.ToLower() == ".bmp" || extension.ToLower() == ".png" || extension.ToLower() == ".gif")
		{
			return true;
		}
		else
		{
			return false;
		}
	}


	protected void btnSubmit_Click(object sender, EventArgs e)
	{
		try
		{
			if (FileUpload1.PostedFile.FileName == "")
			{
				this.lblInfo.Text = "请选择上传文件！";
			}
			else
			{
				string imgPath = FileUpload1.PostedFile.FileName;  
				if (IsAllowedExtension(imgPath) == true)
				{
					string imgName = imgPath.Substring(imgPath.LastIndexOf("/") + 1);
					DateTime dateTime = DateTime.Now;
					string newFileName = dateTime.ToString("yyyyMMddhhmmss");
					newFileName = "img" + newFileName + Path.GetExtension(imgName);
					string serverPath = Server.MapPath("~//images/Upload/") + newFileName;
					FileUpload1.PostedFile.SaveAs(serverPath);
					string imgconnect= ConfigurationManager.ConnectionStrings["db17135111ConnectionString"].ConnectionString;
					SqlConnection connection = new SqlConnection(imgconnect);
					connection.Open();
					string insertcmd = "insert into Img(Name,Path)values(@Name,@Path)";
					SqlCommand mycmd = new SqlCommand(insertcmd, connection);
					mycmd.Parameters.AddWithValue("@Path", serverPath.Trim());
					mycmd.Parameters.AddWithValue("@Name", newFileName.Trim());
					int result = 0;
					result = mycmd.ExecuteNonQuery();
					connection.Close();
					txtImgName.Text = serverPath;
					bindData();
					this.lblInfo.Text = "上传成功！";
				}
				else
				{
					this.lblInfo.Text = "请上传图片";
				}
			}
		}
		catch (Exception ex)
		{
			this.lblInfo.Text = "上传发生错误！原因是：" + ex.ToString();
		}

	}
}