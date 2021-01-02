<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="showShopcar.aspx.cs" Inherits="user_showShopcar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/spinner/jquery.bootstrap-touchspin.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/extensions/toastr.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="http://cdn.bootstrapmb.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/colors.css">
    <!--<link rel="stylesheet" type="text/css" href="app-assets/css/components.css">-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/app-ecommerce-shop.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/wizard.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/extensions/toastr.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <!-- END: Custom CSS-->


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table border="0">
        <tr>
            <td>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <emptydatatemplate>
            <span>您的购物车为空</span>
        </emptydatatemplate>
                        <itemtemplate>
                                    <td class="product-img">                    <asp:Image runat="server" width="100px" height="100px" ImageUrl='<%# Eval("pIMG") %>' alt="img-placeholder" />

                                    </td>
                   <td><asp:Label ID="pIDLabel" runat="server" Text='<%# Eval("pID") %>' /></td>
                                    
                                    <td class="product-name"><asp:Label ID="pNAMELabel" runat="server" Text='<%# Eval("pNAME") %>' /></td>
                                    <td class="product-category">
                                        ￥：<asp:Label ID="pPRICELabel" runat="server" Text='<%# Eval("pPRICE") %>' />
                                    </td>
                                    <td>
                                        <div class="product-category">
                                            <asp:TextBox class="form-control round" ID="txtNum" runat="server" Text='<%# Eval("num") %>' AutoPostBack="true"
                        OnTextChanged="txtNum_TextChanged"></asp:TextBox>
                                                    <asp:Label ID="lblPid" runat="server" Text='<%# Eval("pID") %>' Visible="false" />
                                        </div>
                                    </td>
                                    <td class="product-price">￥：<asp:Label ID="totalPriceLabel" runat="server" Text='<%# Eval("totalPrice") %>' /></td>

               

        </itemtemplate>
                        <layouttemplate>
                        <table class="table data-thumb-view" id="Table2" runat="server">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th1" runat="server">                                    图片                                </th>
                                <th id="Th2" runat="server">                                    商品编号                                </th>
                                <th id="Th3" runat="server">                                    商品名称                               </th>
                                <th id="Th4" runat="server">                                    单价                               </th>
                                <th id="Th5" runat="server">                                    数量                                </th>
                                <th id="Th6" runat="server">                                    总价                                </th>
                            </tr>                            <tr id="itemPlaceholder" runat="server">                            </tr>
                        </table>
        </layouttemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT dbo.shopCar.pID, dbo.Products.pIMG, dbo.Products.pNAME, dbo.Products.pPRICE, dbo.shopCar.num, dbo.shopCar.num * dbo.Products.pPRICE AS totalPrice FROM dbo.Products INNER JOIN dbo.shopCar ON dbo.Products.pID = dbo.shopCar.pID WHERE (dbo.shopCar.username = @username)">
                        <selectparameters>
            <asp:SessionParameter Name="username" SessionField="username1" />
        </selectparameters>
                    </asp:SqlDataSource>
                        </ContentTemplate>
                </asp:UpdatePanel>

            </td>
        </tr>
    </table>
    <table align="right" border="0">
        <tr>
            <td>
                <p class="font-medium-3">您购物车目前总价: <mark>
                <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>元</mark>人民币。</p>
                <asp:Button class="btn mb-1 btn-primary btn-lg btn-block waves-effect waves-light" ID="btnSubmit" runat="server" Text="提交订单" OnClick="btnSubmit_Click" CausesValidation="False" />
            </td>
        </tr>
    </table>
        <!-- BEGIN: Vendor JS-->
    <script src="app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="app-assets/vendors/js/forms/spinner/jquery.bootstrap-touchspin.js"></script>
    <script src="app-assets/vendors/js/extensions/jquery.steps.min.js"></script>
    <script src="app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <script src="app-assets/vendors/js/extensions/toastr.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="app-assets/js/core/app-menu.js"></script>
    <script src="app-assets/js/core/app.js"></script>
    <script src="app-assets/js/scripts/components.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="app-assets/js/scripts/pages/app-ecommerce-shop.js"></script>
    <!-- END: Page JS-->
</asp:Content>

