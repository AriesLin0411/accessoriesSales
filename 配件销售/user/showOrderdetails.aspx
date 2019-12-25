<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="showOrderdetails.aspx.cs" Inherits="user_showOrderdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="orderId,pID" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="orderIdLabel" runat="server" Text='<%# Eval("orderId") %>' />
                </td>
                <td>
                    <asp:Label ID="pIDLabel" runat="server" Text='<%# Eval("pID") %>' />
                </td>
                <td>
                    <asp:Label ID="numberLabel" runat="server" Text='<%# Eval("number") %>' />
                </td>
                <td>
                    <asp:Label ID="totalPriceLabel" runat="server" Text='<%# Eval("totalPrice") %>' />
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
                                <th runat="server">商品号</th>
                                <th runat="server">数量</th>
                                <th runat="server">总价</th>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT * FROM [orderDetails] WHERE ([orderId] = @orderId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="orderId" QueryStringField="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

