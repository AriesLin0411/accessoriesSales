using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_statOrder : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void Button_Click(object sender, EventArgs e)
	{
		ExportToExcel(ListView1);
	}
	public override void VerifyRenderingInServerForm(Control control)
	{
		// Confirms that an HtmlForm control is rendered for        the specified ASP.NET server control at run time.
	}

	protected void ExportToExcel(ListView lv) //参数类型是listview。如要输出gridview控件的内容，此处参数类型改为gridview即可
	{
		Response.Clear();
		Response.Buffer = true;
		Response.Charset = "utf-8";
		//下面这行很重要，  attachment 参数表示作为附件下载，您可以改成 online在线打开
		//filename=FileFlow.xls 指定输出文件的名称，注意其扩展名和指定文件类型相符，可以为：.doc || .xls || .txt ||.htm
		Response.AppendHeader("Content-Disposition", "attachment;filename=FileFlow.xls");
		Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
		//Response.ContentType指定文件类型 可以为application/ms-excel || application/ms-word || application/ms-txt || application/ms-html || 或其他浏览器可直接支持文档
		Response.ContentType = "application/ms-excel";
		this.EnableViewState = false;
		System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
		System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
		//渲染控件，生成可输出的内容
		lv.RenderControl(oHtmlTextWriter);
		//this 表示输出本页，你也可以绑定datagrid,或其他支持obj.RenderControl()属性的控件
		Response.Write(oStringWriter.ToString());
		Response.End();
	}

}