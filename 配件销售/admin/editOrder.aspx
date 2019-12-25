<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="editOrder.aspx.cs" Inherits="admin_editOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="orderId,userName" DataSourceID="SqlDataSource1">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>没有需要发货的订单</td>
                </tr>
            </table>
        </EmptyDataTemplate>
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
                <asp:Button ID="Button1" runat="server" Text="发货" CommandName="btnDeliver" OnCommand="Button_Deliver"
                        CommandArgument='<%# Eval("orderId") %>' />                   
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
                                <th runat="server">订单时间</th>
                                <th runat="server">总价</th>
                                <th runat="server">发货</th>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT * FROM [orders] WHERE ([status] = @status)">
        <SelectParameters>
            <asp:Parameter DefaultValue="已付款" Name="status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

