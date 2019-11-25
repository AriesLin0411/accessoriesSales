<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:cornflowerblue;">
    <form id="form1" runat="server">
        <div>
            <div>
                用户注册</div>
            <center>
            <asp:Table ID="Table1" runat="server" Width="728px" Height="350px" BackColor="GhostWhite">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">手机号:</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtPhonenumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="txtPhonenumber"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="电话格式不正确" ValidationExpression="^1[345678]\d{9}$" ControlToValidate="txtPhonenumber"></asp:RegularExpressionValidator>
</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">用户名:</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>

</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">密码:</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>

</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">确认密码:</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtConfirmpassword" runat="server" TextMode="Password" ControlToValidate="txtConfirmpassword"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="txtConfirmpassword"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致" ControlToCompare="txtPassword" ControlToValidate="txtConfirmpassword"></asp:CompareValidator>
</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">地址:</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>

</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">邮箱:</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="邮箱格式不正确" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)@\w+([-.]\w+).\w+([-.]\w+)*"></asp:RegularExpressionValidator>

</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">性别:</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:RadioButton ID="rdbMale" runat="server" GroupName="sex" Checked="True" />男
                        <asp:RadioButton ID="rdbFemale" runat="server" GroupName="sex" />女
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        
                    </asp:TableCell>
                    <asp:TableCell runat="server"><asp:Button ID="btnSubmit" runat="server" Text="注册" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="重置" OnClick="btnReset_Click" CausesValidation="False" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                    </asp:TableCell>
                    <asp:TableCell runat="server"><asp:HyperLink ID="hlkLogin" runat="server" NavigateUrl="Login.aspx">已有帐号,直接登录</asp:HyperLink>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                </center>
        </div>
    </form>
</body>
</html>
