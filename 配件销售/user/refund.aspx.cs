using Aop.Api;
using Aop.Api.Domain;
using Aop.Api.Request;
using Aop.Api.Response;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pagepay_refund : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cnnstr1 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection1 = new SqlConnection(cnnstr1);
        string cmdstr1 = "select * from orders where orderid=N'" + Request.QueryString["orderid"].ToString().Trim() + "'";
        SqlCommand sqlcmd1 = new SqlCommand(cmdstr1, connection1);
        connection1.Open();
        SqlDataReader dr1 = sqlcmd1.ExecuteReader();
        if (dr1.Read())
        {

            WIDout_trade_no.Text = dr1["orderid"].ToString().Trim();
            WIDrefund_amount.Text = dr1["totalPrice"].ToString().Trim();
        }
    }

    protected void BtnAlipay_Click(object sender, EventArgs e)
    {

        string changeStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(changeStr);
        string changeString = "update orders set status=@status where orderId=@orderId";
        SqlCommand changeCmd = new SqlCommand(changeString, connection);
        changeCmd.Parameters.AddWithValue("@orderId", WIDout_trade_no.Text.ToString().Trim());
        changeCmd.Parameters.AddWithValue("@status", "已退款");
        try
        {
            connection.Open();
            changeCmd.ExecuteNonQuery();
        }
        catch (Exception ex)//出错时
        {
            //Response.Write(ex.Message);
        }
        finally
        {   //如果连接打开，则关闭连接
            if (connection.State == System.Data.ConnectionState.Open)
            { connection.Close(); }
        }
        DefaultAopClient client = new DefaultAopClient(config.gatewayUrl, config.app_id, config.private_key, "json", "1.0", config.sign_type, config.alipay_public_key, config.charset, false);

        // 商户订单号，和交易号不能同时为空
        string out_trade_no = WIDout_trade_no.Text.Trim();

        // 支付宝交易号，和商户订单号不能同时为空
        string trade_no = WIDtrade_no.Text.Trim();

        // 退款金额，不能大于订单总金额
        string refund_amount = WIDrefund_amount.Text.Trim();

        // 退款原因
        string refund_reason = WIDrefund_reason.Text.Trim();

        // 退款单号，同一笔多次退款需要保证唯一，部分退款该参数必填。
        string out_request_no = WIDout_request_no.Text.Trim();

        AlipayTradeRefundModel model = new AlipayTradeRefundModel();
        model.OutTradeNo = out_trade_no;
        model.TradeNo = trade_no;
        model.RefundAmount = refund_amount;
        model.RefundReason = refund_reason;
        model.OutRequestNo = out_request_no;

        AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();
        request.SetBizModel(model);

        AlipayTradeRefundResponse response = null;
        try
        {
            response = client.Execute(request);
            WIDresule.Text = response.Body;

        }
        catch (Exception exp)
        {
            throw exp;
        }
        Response.Redirect("showOrders.aspx");
    }
}