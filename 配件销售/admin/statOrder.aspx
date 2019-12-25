<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="statOrder.aspx.cs" Inherits="admin_statOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Button ID="Button1" runat="server" Text="导出" OnClick="Button_Click" />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="商品号" DataSourceID="SqlDataSource1">


        <emptydatatemplate>
            <table runat="server" style="">
                <tr>
                    <td>未返回数据。</td>
                </tr>
            </table>
        </emptydatatemplate>

        <itemtemplate>
            <tr style="">
                <td>
                    <asp:Label ID="商品号Label" runat="server" Text='<%# Eval("商品号") %>' />
                </td>
                <td>
                    <asp:Label ID="商品名Label" runat="server" Text='<%# Eval("商品名") %>' />
                </td>
                <td>
                    <asp:Label ID="单价Label" runat="server" Text='<%# Eval("单价") %>' />
                </td>
                <td>
                    <asp:Label ID="销量Label" runat="server" Text='<%# Eval("销量") %>' />
                </td>
                <td>
                    <asp:Label ID="总金额Label" runat="server" Text='<%# Eval("总金额") %>' />
                </td>
            </tr>
        </itemtemplate>
        <layouttemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">商品号</th>
                                <th runat="server">商品名</th>
                                <th runat="server">单价</th>
                                <th runat="server">销量</th>
                                <th runat="server">总金额</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </layouttemplate>

    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="select t1.pID 商品号,t1.pNAME 商品名,t1.pPRICE 单价,sum(number) 销量,sum(totalPrice) 总金额 from Products t1,orderDetails t2 where t1.pID=t2.pID and t2.orderId in (select orderId from orders where status='交易完成') group by t1.pID,t1.pNAME,t1.pPRICE"></asp:SqlDataSource>
</asp:Content>

