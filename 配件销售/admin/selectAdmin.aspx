<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="selectAdmin.aspx.cs" Inherits="admin_selectProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<asp:Label ID="Label1" runat="server" Text="查询关键字"></asp:Label>
        <asp:TextBox ID="txtSelectValue" runat="server"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="查找" OnClick="btnSearch_Click"></asp:Button>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="adminName" DataSourceID="SqlDataSource2" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" >
          
            <ItemTemplate>
                <tr style="">
                    <td>
                    <asp:CheckBox ID="CheckBox1" runat="server"></asp:CheckBox>
                    </td>
                   <td>
                       <asp:Label ID="adminNameLabel" runat="server" Text='<%# Eval("adminName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="adminSexLabel" runat="server" Text='<%# Eval("adminSex") %>' />
                    </td>
                    <td>
                        <asp:Label ID="adminPhonenumberLabel" runat="server" Text='<%# Eval("adminPhonenumber") %>' />
                        
                    </td>
                    <td>
                        <asp:Label ID="adminEmailLabel" runat="server" Text='<%# Eval("adminEmail") %>' />
                    </td>
                    <td width="150px">
                        <asp:LinkButton ID="LinkButtonDUpdate" runat="server" Text="修改" CommandName="Button_Update"
                            OnCommand="Button_Update" CommandArgument='<%# Eval("adminName") %>'></asp:LinkButton>|
                        <asp:LinkButton ID="LinkButtonDelete" runat="server" Text="删除" CommandName="Button_Delete"
                            OnCommand="Button_Delete" CommandArgument='<%# Eval("adminName") %>'></asp:LinkButton>|
                        <a href='showAdmin.aspx?id=<%# Eval("adminName") %>' target="_blank">查看</a>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th id="Th1" runat="server">
                                    <asp:LinkButton ID="lkbtnBatchDelete" runat="server" Text="批量删除" CommandName="Button_BatchDelete" OnCommand="Button_BatchDelete" OnClientClick="javascript:return confirm('你确定要进行批量删除吗？')"  ></asp:LinkButton>
                                    </th>
                                    <th runat="server">管理员名</th>
                                    <th runat="server">管理员性别</th>
                                    <th runat="server">管理员电话</th>
                                    <th runat="server">管理员邮箱</th>
                                    <th id="Th6" runat="server">
                                        修改|删除|查看
                                    </th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                        
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT [adminName], [adminSex], [adminPhonenumber], [adminEmail] FROM [admin]"></asp:SqlDataSource>
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="3">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
            </Fields>
        </asp:DataPager>
        </center>
</asp:Content>

