<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="selectProducts.aspx.cs" Inherits="admin_selectProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<asp:Label ID="Label1" runat="server" Text="查询关键字"></asp:Label>
        <asp:TextBox ID="txtSelectValue" runat="server"></asp:TextBox>
<asp:DropDownList ID="ddlClass" runat="server" DataSourceID="SqlDataSource1" DataTextField="cName" DataValueField="cId"></asp:DropDownList>
<asp:Button ID="btnSearch" runat="server" Text="查找" OnClick="btnSearch_Click"></asp:Button>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT [cId], [cName] FROM [Class] union select 0, '所有类别'"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="pID" DataSourceID="SqlDataSource2" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" >
          
            <ItemTemplate>
                <tr style="">
                   <td>
                    <asp:CheckBox ID="CheckBox1" runat="server"></asp:CheckBox>
                    </td>
                    <td>
                        <asp:Label ID="pIDLabel" runat="server" Text='<%# Eval("pID") %>' />
                    </td>
                    <td title='<%#Eval("pNAME") %>'>
                        <%#Eval("pNAME").ToString().Length>=6?Eval("pNAME").ToString().Substring(0,6):Eval("pNAME") %>
                        
                    </td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%#Eval("pIMG") %>'></asp:Image>
                    </td>
                    <td>
                        <asp:Label ID="pPRICELabel" runat="server" Text='<%# Eval("pPRICE") %>' />
                    </td>
                    <td>
                        <asp:Label ID="pCLASSIDLabel" runat="server" Text='<%# Eval("pCLASSID") %>' />
                    </td>
                    <td>
                        <%# ((DateTime)Eval("pTIME")).ToString("yyyyMMdd") %>
                    </td>
                    <td width="150px">
                        <asp:LinkButton ID="LinkButtonDUpdate" runat="server" Text="修改" CommandName="Button_Update"
                            OnCommand="Button_Update" CommandArgument='<%# Eval("pID") %>'></asp:LinkButton>|
                        <asp:LinkButton ID="LinkButtonDelete" runat="server" Text="删除" CommandName="Button_Delete"
                            OnCommand="Button_Delete" CommandArgument='<%# Eval("pID") %>'></asp:LinkButton>|
                        <a href='showProduct.aspx?id=<%# Eval("pID") %>' target="_blank">查看</a>
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
                                    <th runat="server">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Sort" CommandArgument="pID">商品编号</asp:LinkButton>
                                    </th>
                                    <th runat="server">商品名称</th>
                                    <th runat="server">图片</th>
                                    <th runat="server">价格</th>
                                    <th runat="server">类别</th>
                                    <th runat="server">时间</th>
                                    <th id="Th6" runat="server">
                                        修改|删除|查看
                                    </th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT [pID], [pNAME], [pIMG], [pPRICE], [pCLASSID], [pTIME] FROM [Products]"></asp:SqlDataSource>
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="3">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
            </Fields>
        </asp:DataPager>
        </center>
</asp:Content>

