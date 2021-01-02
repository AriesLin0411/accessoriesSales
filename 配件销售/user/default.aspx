<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="user_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- Banners Area -->
        <div class="banners-area pb-30 bg-grey">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <!-- Category Menu -->
                        <div class="catmenu catmenu-2 mt-30">
                            <button class="catmenu-trigger is-active">
                                <span>分类</span>
                            </button>
                            <nav class="catmenu-body">
                                <ul>
                                    <li ><a href="showlistProducts.aspx?type=1&name=显卡"><i class="ion ion-ios-power"></i>显卡</a></li>
                                    <li ><a href="showlistProducts.aspx?type=2&name=CPU"><i class="ion ion-md-headset"></i>CPU</a></li>
                                    <li ><a href="showlistProducts.aspx?type=3&name=主板"><i class="ion ion-ios-infinite"></i>主板</a></li>
                                    <li><a href="showlistProducts.aspx?type=4&name=机箱"><i class="ion ion-logo-game-controller-b"></i>机箱</a></li>
                                    <li><a href="showlistProducts.aspx?type=5&name=显示器"><i class="ion ion-ios-tablet-landscape"></i>显示器</a></li>
                                    <li><a href="showlistProducts.aspx?type=6&name=内存条"><i class="ion ion-ios-volume-high"></i>内存条</a></li>
                                    <li><a href="showlistProducts.aspx?type=7&name=固态硬盘"><i class="ion ion-ios-desktop"></i>固态硬盘</a></li>
                                    <li><a href="showlistProducts.aspx?type=8&name=机械硬盘"><i class="ion ion-md-watch"></i>机械硬盘</a></li>
                                    <li class="catmenu-hidden"><a href="showlistProducts.aspx?type=9&name=声卡"><i class="ion ion-ios-camera"></i>声卡</a></li>
                                    <li class="catmenu-hidden"><a href="showlistProducts.aspx?type=1&name=网卡"><i class="ion ion-ios-desktop"></i>网卡</a></li>
                                    <li class="catmenu-hidden"><a href="showlistProducts.aspx?type=1&name=风冷散热器"><i class="ion ion-md-watch"></i>风冷散热器</a></li>
                                    <li class="catmenu-hidden"><a href="showlistProducts.aspx?type=1&name=水冷散热器"><i class="ion ion-ios-camera"></i>水冷散热器</a></li>
                                    <li class="catmenu-moretrigger"><a href="#"><i class="ion ion-ios-more"></i>更多分类</a></li>
                                </ul>
                            </nav>
                        </div>
                        <!--// Category Menu -->
                    </div>

                    <div class="col-lg-9">
                        <!-- Hero Area -->
                        <div class="herobanner herobanner-3 slider-navigation slider-dots mt-30">

                            <!-- Herobanner Single -->
                            <div class="herobanner-single">
                                <img src="img/1.png" alt="hero image">
                                <div class="herobanner-content">
                                    <div class="herobanner-box">
                                        <h1>星驰电掣</h1>
                                    </div>
                                    <div class="herobanner-box">
                                        <h1>气吞山河</h1>
                                    </div>
                                    <div class="herobanner-box">
                                        <h3>MSI</h3>
                                    </div>
                                </div>
                                <span class="herobanner-progress"></span>
                            </div>
                            <!--// Herobanner Single -->

                            <!-- Herobanner Single -->
                            <div class="herobanner-single">
                                <img src="img/2.png" alt="hero image">
                                <span class="herobanner-progress"></span>
                            </div>
                            <!--// Herobanner Single -->

                        </div>
                        <!--// Hero Area -->
                    </div>

                    <div class="col-md-4">
                        <div class="imgbanner mt-30">
                            <a href="#">
                                <img src="img/3.png" alt="banner">
                            </a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="imgbanner mt-30">
                            <a href="#">
                                <img src="img/4.png" alt="banner">
                            </a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="imgbanner mt-30">
                            <a href="#">
                                <img src="img/5.png" alt="banner">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--// Banners Area -->
    <center>
    <table style="width: 70%;">
        <tr>
            <td>&nbsp;
                最新商品<hr/>
                <asp:ListView ID="ListView2" runat="server" DataKeyNames="pID" DataSourceID="SqlDataSource2" GroupItemCount="3">
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        
                        <td runat="server" style="">
                        <div class="card ecommerce-card">
                        <div class="card-content">
                            <div class="item-img text-center">
                            <asp:Image class="img-fluid" alt="img-placeholder" ID="Image1" runat="server" ImageUrl='<%# Eval("pIMG") %>' title='<%# Eval("pNAME") %>' />
                                
                            </div>
                            <div class="card-body">
                                <div class="item-wrapper">
                                    <div>
                                        <h6 class="item-price">
                                            ￥:
                            <asp:Label ID="pPRICELabel" runat="server" Text='<%# Eval("pPRICE") %>' />
                                        </h6>
                                    </div>
                                </div>
                                <div class="item-name">
                                    <span>
                            <a href="showProducts.aspx?id=<%# Eval("pID") %>&type=<%# Eval("pCLASSID") %>" title='<%# Eval("pNAME") %>'><%# Eval("pNAME").ToString().Length>6?Eval("pNAME").ToString().Substring(0,6):Eval("pNAME") %></a>
                                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                            
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
        <center>
            <!-- BEGIN: Vendor JS-->
    <script src="app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
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

