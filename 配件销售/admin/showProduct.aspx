<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMasterPage.master" AutoEventWireup="true" CodeFile="showProduct.aspx.cs" Inherits="admin_showProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([pID] = @pID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="pID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="pID" DataSourceID="SqlDataSource1">
       
        <ItemTemplate>
            <span style="">商品编号:
            <asp:Label ID="pIDLabel" runat="server" Text='<%# Eval("pID") %>' />
            <br />
            商品名称:
            <asp:Label ID="pNAMELabel" runat="server" Text='<%# Eval("pNAME") %>' />
            <br />
            商品图片:
            <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%#Eval("pIMG") %>' ImageAlign="AbsMiddle"></asp:Image>
            <br />
            商品描述:
            <asp:Label ID="pDESCRIBELabel" runat="server" Text='<%# Eval("pDESCRIBE") %>' />
            <br />
            商品价格:
            <asp:Label ID="pPRICELabel" runat="server" Text='<%# Eval("pPRICE") %>' />
            <br />
            商品类别:
            <asp:Label ID="pCLASSIDLabel" runat="server" Text='<%# Eval("pCLASSID") %>' />
            <br />
            商品详情:
            <asp:Label ID="pDETAILSLabel" runat="server" Text='<%# Eval("pDETAILS") %>' />
            <br />
            添加时间:
            <asp:Label ID="pTIMELabel" runat="server" Text='<%# Eval("pTIME") %>' />
            <br />
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
</asp:Content>

