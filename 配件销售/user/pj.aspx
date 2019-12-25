<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="pj.aspx.cs" Inherits="user_pj" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h3>商品质量(1-5):</h3><asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>1分</asp:ListItem>
        <asp:ListItem>2分</asp:ListItem>
        <asp:ListItem>3分</asp:ListItem>
        <asp:ListItem>4分</asp:ListItem>
        <asp:ListItem>5分</asp:ListItem>
              </asp:DropDownList>
     <h3>服务质量(1-5):</h3><asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem>1分</asp:ListItem>
        <asp:ListItem>2分</asp:ListItem>
        <asp:ListItem>3分</asp:ListItem>
        <asp:ListItem>4分</asp:ListItem>
        <asp:ListItem>5分</asp:ListItem>
              </asp:DropDownList>
    <h3> 物流评价(1-5):</h3><asp:DropDownList ID="DropDownList3" runat="server">
        <asp:ListItem>1分</asp:ListItem>
        <asp:ListItem>2分</asp:ListItem>
        <asp:ListItem>3分</asp:ListItem>
        <asp:ListItem>4分</asp:ListItem>
        <asp:ListItem>5分</asp:ListItem>
              </asp:DropDownList>
     <h3>评价:(限制50字)</h3><asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" />
</asp:Content>

