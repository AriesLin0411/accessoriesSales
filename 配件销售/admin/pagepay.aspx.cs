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

public partial class pagepay_pagepay : System.Web.UI.Page
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
            WIDsubject.Text = dr1["datetime"].ToString().Trim();
            WIDtotal_amount.Text = dr1["totalPrice"].ToString().Trim();
        }
    }

    protected void BtnAlipay_Click(object sender, EventArgs e)
    {

        string changeStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(changeStr);
        string changeString = "update orders set status=@status where orderId=@orderId";
        SqlCommand changeCmd = new SqlCommand(changeString, connection);
        changeCmd.Parameters.AddWithValue("@orderId", WIDout_trade_no.Text.ToString().Trim());
        changeCmd.Parameters.AddWithValue("@status", "已付款");
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

        // 外部订单号，商户网站订单系统中唯一的订单号
        string out_trade_no = WIDout_trade_no.Text.Trim();

        // 订单名称
        string subject = WIDsubject.Text.Trim();

        // 付款金额
        string total_amout = WIDtotal_amount.Text.Trim();

        // 商品描述
        string body = WIDbody.Text.Trim();

        // 组装业务参数model
        AlipayTradePagePayModel model = new AlipayTradePagePayModel();
        model.Body = body;
        model.Subject = subject;
        model.TotalAmount = total_amout;
        model.OutTradeNo = out_trade_no;
        model.ProductCode = "FAST_INSTANT_TRADE_PAY";
        model.TimeoutExpress = "30m";

        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        // 设置同步回调地址
        request.SetReturnUrl("https://blogshiguang.cn");
        // 设置异步通知接收地址
        request.SetNotifyUrl("");
        // 将业务model载入到request
        request.SetBizModel(model);

        AlipayTradePagePayResponse response = null;
        try
        {
            response = client.pageExecute(request,null,"post");
            Response.Write(response.Body);
        }
        catch (Exception exp)
        {
            throw exp;
        }
       

    }
}