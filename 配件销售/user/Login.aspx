<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  <style type="text/css">
     html,body{
         height: 100%;
  }
      .auto-style2 {
          width: 399px;
          text-align:right;
          height: 34px;
      }
      .auto-style4 {
          height: 57px;
          width: 399px;
          text-align:right;
      }
      .auto-style5 {
          height: 57px;
      }
      .auto-style6 {
          width: 399px;
          height: 54px;
          text-align:right;
      }
      .auto-style7 {
          height: 54px;
      }
      .auto-style10 {
          width: 399px;
          height: 30px;
          text-align:right;
      }
      .auto-style11 {
          height: 30px;
      }
      .auto-style12 {
          height: 10%;
          width: 100%;
          margin-top: 31px;
      }
      .auto-style13 {
          height: 70%;
          width: 100%;
      }
      .auto-style14 {
          height: 50px;
      }
      .auto-style15 {
          width: 82px;
          height: 41px;
      }
      .auto-style16 {
          width: 105px;
          height: 40px;
          cursor: pointer;
      }
      .auto-style17 {
          width: 399px;
          height: 43px;
          text-align: right;
      }
      .auto-style18 {
          height: 43px;
      }
      .auto-style19 {
          width: 399px;
          height: 48px;
          text-align: right;
      }
      .auto-style20 {
          height: 48px;
      }
      .auto-style21 {
          height: 382px;
          width: 100%;
      }
  </style>
</head>
<body >
    <form id="form1" runat="server">
        <div class="auto-style21">

            <div style="height: 20%; width: 100%;text-align:center;font-size:30px;">
                用户登录</div>
            <div class="auto-style13">
                <table style="margin: 0px auto 0px auto; width: 60%;">
                    <tr>
                        <td class="auto-style6">用户名/手机号:</td>
                        <td class="auto-style7"><asp:TextBox ID="txtUsername" runat="server" Height="29px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">密码:</td>
                        <td class="auto-style5"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="33px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="必填" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19">验证码:</td>
                        <td class="auto-style20"><asp:TextBox ID="txtCheckcode" runat="server" Height="26px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp; </td>
                    </tr>
                    <tr>
                        <td class="auto-style17"></td>
                        <td class="auto-style18">
                        &nbsp;<img src="checkimage.aspx" alt="" title='看不清楚，双击图片换一张。' onclick="this.src = 'checkimage.aspx?flag=' + Math.random()" border="1" class="auto-style16" /></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"></td>
                        <td class="auto-style11"><asp:CheckBox ID="ckbRemember" runat="server"  Text="一周之内记住我" /></td>
                        
                    </tr>
                    <tr>
                        <td class="auto-style2"></td>
                        <td class="auto-style14"><asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click" Height="42px" Width="86px" />
                            &nbsp;&nbsp;
                            <input id="btnReset" type="reset" value="重置" class="auto-style15" /></td>
                        
                    </tr>
                </table>
            </div>
            <div class="auto-style12">
            </div>
        </div>
    </form>
</body>
</html>
