<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="pj.aspx.cs" Inherits="user_pj" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="http://cdn.bootstrapmb.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/plugins/animate/animate.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">
    <!-- END: Custom CSS-->


    <h3>商品质量(1-5):</h3><div class="collapse-margin"><div class="card-header" id="headingOne"><asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>1分</asp:ListItem>
        <asp:ListItem>2分</asp:ListItem>
        <asp:ListItem>3分</asp:ListItem>
        <asp:ListItem>4分</asp:ListItem>
        <asp:ListItem>5分</asp:ListItem>
              </asp:DropDownList></div></div>
     <h3>服务质量(1-5):</h3><div class="collapse-margin"><div class="card-header" id="headingOne"><asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem>1分</asp:ListItem>
        <asp:ListItem>2分</asp:ListItem>
        <asp:ListItem>3分</asp:ListItem>
        <asp:ListItem>4分</asp:ListItem>
        <asp:ListItem>5分</asp:ListItem>
              </asp:DropDownList></div></div>
    <h3> 物流评价(1-5):</h3><div class="collapse-margin"><div class="card-header" id="headingOne"><asp:DropDownList ID="DropDownList3" runat="server">
        <asp:ListItem>1分</asp:ListItem>
        <asp:ListItem>2分</asp:ListItem>
        <asp:ListItem>3分</asp:ListItem>
        <asp:ListItem>4分</asp:ListItem>
        <asp:ListItem>5分</asp:ListItem>
              </asp:DropDownList></div></div>
     <h3>评价:(限制50字)</h3><div class="collapse-margin"><div class="card-header" id="headingOne"><asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox></div></div>
    <div class="collapse-margin"><div class="card-header" id="headingOne"><asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" /></div></div>
</asp:Content>

