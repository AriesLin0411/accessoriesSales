<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="pj.aspx.cs" Inherits="admin_pj" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="orderid" DataSourceID="SqlDataSource1">
        
        
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>未返回数据。</td>
                </tr>
            </table>
        </EmptyDataTemplate>
       
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Label ID="orderidLabel" runat="server" Text='<%# Eval("orderid") %>' />
                </td>
                <td>
                    <asp:Label ID="spLabel" runat="server" Text='<%# Eval("sp") %>' />
                </td>
                <td>
                    <asp:Label ID="wlLabel" runat="server" Text='<%# Eval("wl") %>' />
                </td>
                <td>
                    <asp:Label ID="fwLabel" runat="server" Text='<%# Eval("fw") %>' />
                </td>
                <td>
                    <asp:Label ID="txtLabel" runat="server" Text='<%# Eval("txt") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server">订单号</th>
                                <th runat="server">商品质量</th>
                                <th runat="server">物流评价</th>
                                <th runat="server">服务评价</th>
                                <th runat="server">评论</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT * FROM [pj]"></asp:SqlDataSource>
</asp:Content>

