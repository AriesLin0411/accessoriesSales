<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="showOrders.aspx.cs" Inherits="user_showOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="orderId,userName" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="orderIdLabel" runat="server" Text='<%# Eval("orderId") %>' />
                </td>
                <td>
                    <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                </td>
                <td>
                    <asp:Label ID="datetimeLabel" runat="server" Text='<%# Eval("datetime") %>' />
                </td>
                <td>
                    <asp:Label ID="totalPriceLabel" runat="server" Text='<%# Eval("totalPrice") %>' />
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="去付款" CommandName="btnPay" OnCommand="Button_Pay"
                        CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "未付款"?true:false %>' />
                    <asp:Button ID="Button2" runat="server" Text="确认收货" CommandName="btnReceive" OnCommand="Button_Receive"
                        CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "待收货"?true:false %>' />
                    <asp:Button ID="Button3" runat="server" Text="评价" CommandName="btnComment" OnCommand="Button_Comment"
                        CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "待评价"?true:false %>' />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("status") %>' Visible='<%# (Eval("status").ToString() == "未付款" || Eval("status").ToString() == "待收货" || Eval("status").ToString() == "待评价")?false:true %>' />

                </td>
                <td>
                    <a href='showOrderdetails.aspx?id=<%# Eval("orderId") %>'>详情</a>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">订单号</th>
                                <th runat="server">用户名</th>
                                <th runat="server">时间</th>
                                <th runat="server">价格</th>
                                <th runat="server">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Sort" CommandArgument="status">订单状态</asp:LinkButton>
                                </th>
                                <th runat="server">订单详情</th>
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
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT * FROM [orders] WHERE ([userName] = @userName)">
        <SelectParameters>
            <asp:SessionParameter Name="userName" SessionField="username1" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

