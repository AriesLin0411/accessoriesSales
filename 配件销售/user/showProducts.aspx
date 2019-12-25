<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="showProducts.aspx.cs" Inherits="user_showProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table   border="1" cellspacing="0" cellpadding="0" style="width: 100%;border:solid 5px;width: 100%;">
        <tr>
            <td width="25%">&nbsp;

                <asp:ListView ID="ListView1" runat="server" DataKeyNames="pID" DataSourceID="SqlDataSource1">
                    
                    <ItemTemplate>
                        <span style="">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("pIMG") %>' Width="80px" Height="80px" title='<%# Eval("pNAME") %>' /> <br /> 
                            <a href='showProducts.aspx?id=<%# Eval("pID") %>&type=<%# Eval("pCLASSID") %>' title='<%# Eval("pNAME") %>' ><%# Eval("pNAME").ToString().Length > 6 ? Eval("pNAME").ToString().Substring(0, 6) : Eval("pNAME") %></a> <br /> 
                            ￥: <asp:Label ID="Label2" runat="server" ForeColor="Red" Text='<%# Eval("pPRICE") %>' /> <br />

                          
<br /></span>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                    
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT top 6 [pID], [pNAME], [pIMG], [pPRICE], [pCLASSID] FROM [Products]">
                    <SelectParameters>
<asp:QueryStringParameter Name="pCLASSID" QueryStringField="type"
Type="Int32" />
</SelectParameters>
                </asp:SqlDataSource>

            </td>
            <td>&nbsp;

                <asp:ListView ID="ListView2" runat="server" DataKeyNames="pID" DataSourceID="SqlDataSource2">
                    
                    <ItemTemplate>
                        <span style="">
                            
                            <%# Eval("pNAME") %> <hr /> 
                            <table width="100%"> 
                                <tr>
                                    <td> 
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("pIMG") %>' Width="200px" Height="200px" /> 

                                    </td> 
                                    <td align="left"> 
                                        商品号: <asp:Label ID="Label1" runat="server" Text='<%# Eval("pID") %>' /> <p> 价格￥: <asp:Label ID="Label3" runat="server" Text='<%# Eval("pPRICE") %>' /> </p><p> 购买量: <asp:TextBox ID="txtNum" runat="server" Text="1"></asp:TextBox> </p> <p> <asp:Button ID="btnAdd" runat="server" Text="加入购物车" CommandName="buy" OnCommand="Button_Command" CommandArgument='<%# Eval("pID") %>' CausesValidation="False" /> </p> 

                                    </td> 

                                </tr> 

                            </table> 
                            <br /> 商品详情 
                            <table width="100%"> 
                                <tr>
                                    <td>
                                        <%# Eval("pDESCRIBE") %> 
                                    </td>
                                </tr> 
                            </table>
                            
                           
<br /></span>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([pID] = @pID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="pID" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
<asp:ListView ID="ListView3" runat="server" DataKeyNames="orderid" DataSourceID="SqlDataSource3">
    <EmptyDataTemplate>
        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
            <tr>
                <td>该商品暂无评价。</td>
            </tr>
        </table>
    </EmptyDataTemplate>
    <ItemTemplate>
        <tr style="background-color: #E0FFFF;color: #333333;">
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
                            <th runat="server">商品质量</th>
                            <th runat="server">物流评价</th>
                            <th runat="server">服务质量</th>
                            <th runat="server">评言</th>
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
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT dbo.pj.orderid, dbo.pj.sp, dbo.pj.wl, dbo.pj.fw, dbo.pj.txt FROM dbo.pj INNER JOIN dbo.orderDetails ON dbo.pj.orderid = dbo.orderDetails.orderId WHERE (dbo.orderDetails.pID = @pid)">
    <SelectParameters>
        <asp:QueryStringParameter Name="pid" QueryStringField="id" />
    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table></center>
</asp:Content>

