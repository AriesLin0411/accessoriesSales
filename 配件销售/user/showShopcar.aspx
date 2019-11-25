<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMasterPage3.master" AutoEventWireup="true" CodeFile="showShopcar.aspx.cs" Inherits="user_showShopcar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr><td>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <EmptyDataTemplate>
            <span>您的购物车为空</span>
        </EmptyDataTemplate>
        <ItemTemplate>

                <tr style="">
                <td>
                    <asp:Image runat="server" width="100px" height="100px" ImageUrl='<%# Eval("pIMG") %>' alt="" />
                </td>
                <td>
                   <asp:Label ID="pIDLabel" runat="server" Text='<%# Eval("pID") %>' />
                </td>
                <td>
                    <asp:Label ID="pNAMELabel" runat="server" Text='<%# Eval("pNAME") %>' />
                </td>
                <td>
                    <asp:Label ID="pPRICELabel" runat="server" Text='<%# Eval("pPRICE") %>' />
                </td>
                <td>
                    <asp:TextBox ID="txtNum" runat="server" Text='<%# Eval("num") %>' AutoPostBack="true"
                        OnTextChanged="txtNum_TextChanged"></asp:TextBox>
                    <asp:Label ID="lblPid" runat="server" Text='<%# Eval("pID") %>' Visible="false" />
                </td>
                <td>
                    <asp:Label ID="totalPriceLabel" runat="server" Text='<%# Eval("totalPrice") %>' />
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="删除" CommandName="deleteProduct" OnCommand="Button_Delete"
                        CommandArgument='<%# Eval("pID") %>' OnClientClick="javascript:return confirm('确定要删除吗?');" />
                </td>
            </tr>

        </ItemTemplate>
        <LayoutTemplate>
                        <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th1" runat="server">                                    图片                                </th>
                                <th id="Th2" runat="server">                                    商品编号                                </th>
                                <th id="Th3" runat="server">                                    商品名称                               </th>
                                <th id="Th4" runat="server">                                    单价                               </th>
                                <th id="Th5" runat="server">                                    数量                                </th>
                                <th id="Th6" runat="server">                                    总价                                </th>
                            </tr>                            <tr id="itemPlaceholder" runat="server">                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT dbo.shopCar.pID, dbo.Products.pIMG, dbo.Products.pNAME, dbo.Products.pPRICE, dbo.shopCar.num, dbo.shopCar.num * dbo.Products.pPRICE AS totalPrice FROM dbo.Products INNER JOIN dbo.shopCar ON dbo.Products.pID = dbo.shopCar.pID WHERE (dbo.shopCar.username = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username1" />
        </SelectParameters>
    </asp:SqlDataSource></td>
        </tr>
        </table>
        <table align="right">
        <tr>
            <td>
    <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
    <asp:Button ID="btnSubmit" runat="server" Text="提交订单" OnClick="btnSubmit_Click" CausesValidation="False" /></td></tr>
    </table>
</asp:Content>

