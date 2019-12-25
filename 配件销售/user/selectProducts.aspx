<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="selectProducts.aspx.cs" Inherits="user_selectProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;

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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT [pID], [pNAME], [pIMG], [pPRICE], [pCLASSID] FROM [Products] WHERE ([pNAME] like '%'+@pName+'%')">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="pNAME" QueryStringField="id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>

