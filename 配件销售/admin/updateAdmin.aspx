<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="updateAdmin.aspx.cs" Inherits="admin_updateProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
        .auto-style1 {
            height: 221px;
            text-align:center;
        }
    .auto-style2 {
        height: 27px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width: 100%;text-align:center;">
        <tr>
            <td width="20%">&nbsp;</td>
            <td width="80%">&nbsp; 管理员信息修改</td>
        </tr>
        <tr>
            <td class="auto-style2">管理员名称</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">管理员性别</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtSex" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>管理员密码</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
              <tr>
            <td>管理员电话</td>
            <td>
                <asp:TextBox ID="txtPhonenumber" runat="server"></asp:TextBox>
            </td>
        </tr>
              <tr>
            <td>管理员邮箱</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;
                <asp:Button ID="btnSubmmit" runat="server" Text="修改" OnClick="btnSubmmit_Click" />
                <asp:Button ID="btnReset" runat="server" Text="重置" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

