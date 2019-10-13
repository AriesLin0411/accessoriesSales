<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="adminLogin.aspx">登录</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="adminRegister.aspx">信息修改</asp:HyperLink>
        </div>
    </form>
</body>
</html>
