<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Convex admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Convex admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>管理员登陆</title>
    <link rel="apple-touch-icon" sizes="60x60" href="app-assets/img/ico/apple-icon-60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="app-assets/img/ico/apple-icon-76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="app-assets/img/ico/apple-icon-120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="app-assets/img/ico/apple-icon-152.png">
    <link rel="shortcut icon" type="image/x-icon" href="app-assets/img/ico/favicon.ico">
    <link rel="shortcut icon" type="image/png" href="app-assets/img/ico/favicon-32.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900%7CMontserrat:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="app-assets/fonts/feather/style.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/fonts/simple-line-icons/style.css">
    <link rel="stylesheet" type="text/css" href="app-assets/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/perfect-scrollbar.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/prism.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/app.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body data-col="1-column" class=" 1-column  blank-page blank-page">
    <form id="form1" runat="server">
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <div class="wrapper">
            <!--Login Page Starts-->
            <section id="login">
                <div class="container-fluid">
                    <div class="row full-height-vh">
                        <div class="col-12 d-flex align-items-center justify-content-center gradient-aqua-marine">
                            <div class="card px-4 py-2 box-shadow-2 width-400">
                                <div class="card-header text-center">
                                    <h4 class="text-uppercase text-bold-400 grey darken-1">Login</h4>
                                </div>
                                <div class="card-body">
                                    <div class="card-block">
                                        <form>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-lg" placeholder="用户名" required="required"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtPassword" CssClass="form-control form-control-lg" runat="server" placeholder="密码" required="required"  TextMode="Password"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtCheckcode" CssClass="form-control form-control-lg" runat="server" placeholder="验证码" required="required"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <img src="checkimage.aspx" alt="" title='看不清楚，双击图片换一张。' onclick="this.src = 'checkimage.aspx?flag=' + Math.random()" width="100%" height="50px"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0 ml-5">
                                                            <asp:CheckBox ID="CheckBox1" runat="server"  Checked Font-Size="Medium"/>
                                                            <asp:Label ID="Label1" runat="server" Text="一周之内记住"  for="CheckBox1" Font-Size="Medium"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="text-center col-md-12">
                                                    <asp:Button ID="btnLogin" runat="server" Text="登录" CssClass="btn btn-danger px-4 py-2 text-uppercase white font-small-4 box-shadow-2 border-0" OnClick="btnLogin_Click"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="card-footer grey darken-1">
                                    <div class="text-center mb-1">忘记密码? <a><b>重置</b></a></div>
                                    <div class="text-center">没有账号? <a><b>注册</b></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--Login Page Ends-->
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->

        <!-- BEGIN VENDOR JS-->
        <script src="app-assets/vendors/js/core/jquery-3.3.1.min.js"></script>
        <script src="app-assets/vendors/js/core/popper.min.js"></script>
        <script src="app-assets/vendors/js/core/bootstrap.min.js"></script>
        <script src="app-assets/vendors/js/perfect-scrollbar.jquery.min.js"></script>
        <script src="app-assets/vendors/js/prism.min.js"></script>
        <script src="app-assets/vendors/js/jquery.matchHeight-min.js"></script>
        <script src="app-assets/vendors/js/screenfull.min.js"></script>
        <script src="app-assets/vendors/js/pace/pace.min.js"></script>
        <!-- BEGIN VENDOR JS-->
        <!-- BEGIN PAGE VENDOR JS-->
        <!-- END PAGE VENDOR JS-->
        <!-- BEGIN CONVEX JS-->
        <script src="app-assets/js/app-sidebar.js"></script>
        <script src="app-assets/js/notification-sidebar.js"></script>
        <!-- END CONVEX JS-->
        <!-- BEGIN PAGE LEVEL JS-->
        <!-- END PAGE LEVEL JS-->
    </form>
</body>
</html>
