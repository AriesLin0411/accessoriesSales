<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="user_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;

                <asp:ListView ID="ListView1" runat="server" DataKeyNames="cId" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <a href="showlistProducts.aspx?type=<%# Eval("cId") %>&&name=<%# Eval("cName") %>"><%# Eval("cName") %></a><br/>
                        <br />
<br />
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT [cId], [cName] FROM [Class]"></asp:SqlDataSource>

            </td>
            <td>&nbsp;

                <asp:ListView ID="ListView2" runat="server" DataKeyNames="pID" DataSourceID="SqlDataSource2" GroupItemCount="3">
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <td runat="server" style="">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("pIMG") %>' Width="120px" Height="120px" title='<%# Eval("pNAME") %>' />
                            <br />
                            <a href="showProducts.aspx?id=<%# Eval("pID") %>&&type=<%# Eval("pCLASSID") %>" title='<%# Eval("pNAME") %>'><%# Eval("pNAME").ToString().Length>6?Eval("pNAME").ToString().Substring(0,6):Eval("pNAME") %></a>
                            <br />
                            <br />￥:
                            <asp:Label ID="pPRICELabel" runat="server" ForeColor="red" Text='<%# Eval("pPRICE") %>' />
                            <br />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT top 6 [pID], [pNAME], [pIMG], [pPRICE], [pCLASSID] FROM [Products] ORDER BY [pTIME] DESC"></asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>

