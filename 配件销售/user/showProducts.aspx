<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMasterPage2.master" AutoEventWireup="true" CodeFile="showProducts.aspx.cs" Inherits="user_showProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

            </td>
        </tr>
    </table>
</asp:Content>

