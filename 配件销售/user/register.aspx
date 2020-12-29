<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Vuesax admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuesax admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>注册</title>
    <link rel="apple-touch-icon" href="app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="http://cdn.bootstrapmb.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/authentication.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <!-- END: Custom CSS-->
</head>
<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- BEGIN: Content-->
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <section class="row flexbox-container">
                        <div class="col-xl-8 col-10 d-flex justify-content-center">
                            <div class="card bg-authentication rounded-0 mb-0">
                                <div class="row m-0">
                                    <div class="col-lg-6 d-lg-block d-none text-center align-self-center pl-0 pr-3 py-0">
                                        <img src="app-assets/images/pages/register.jpg" alt="branding logo">
                                    </div>
                                    <div class="col-lg-6 col-12 p-0">
                                        <div class="card rounded-0 mb-0 p-2">
                                            <div class="card-header pt-50 pb-1">
                                                <div class="card-title">
                                                    <h4 class="mb-0">创建账户</h4>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="card-content">
                                                <div class="card-body pt-0">
                                                    <form action="index.html">
                                                        <div class="form-label-group">
                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                <ContentTemplate>
                                                                    <label for="inputName">用户名</label>
                                                                    <asp:TextBox type="text" class="form-control" ID="txtUsername" runat="server" AutoPostBack="True" OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                        <div class="form-label-group">
                                                            <asp:TextBox type="text" class="form-control" ID="txtPhonenumber" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="txtPhonenumber"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="电话格式不正确" ValidationExpression="^1[345678]\d{9}$" ControlToValidate="txtPhonenumber"></asp:RegularExpressionValidator>
                                                            <label for="inputTel">电话号码</label>
                                                        </div>
                                                        <div class="form-label-group">
                                                            <asp:TextBox class="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="邮箱格式不正确" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)@\w+([-.]\w+).\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                            <label for="inputEmail">邮箱</label>
                                                        </div>

                                                        <div class="form-label-group">
                                                            <asp:TextBox class="form-control" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                                            <label for="inputPassword">密码</label>
                                                        </div>
                                                        <div class="form-label-group">
                                                            <asp:TextBox class="form-control" ID="txtConfirmpassword" runat="server" TextMode="Password" ControlToValidate="txtConfirmpassword"></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="txtConfirmpassword"></asp:RequiredFieldValidator>
                                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致" ControlToCompare="txtPassword" ControlToValidate="txtConfirmpassword"></asp:CompareValidator>
                                                            <label for="inputConfPassword">确认密码</label>
                                                        </div>
                                                        <div class="form-label-group">
                                                            <asp:TextBox class="form-control" ID="txtAddress" runat="server"></asp:TextBox>
                                                            <label for="inputAdd">地址</label>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <fieldset class="checkbox">
                                                                    <div class="vs-checkbox-con vs-checkbox-primary">
                                                                        <asp:RadioButton ID="rdbMale" runat="server" GroupName="sex" Checked="True" />
                                                                        <span class="vs-checkbox">
                                                                            <span class="vs-checkbox--check">
                                                                                <i class="vs-icon feather icon-check"></i>
                                                                            </span>
                                                                        </span>
                                                                        <span class="">男</span>
                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <fieldset class="checkbox">
                                                                    <div class="vs-checkbox-con vs-checkbox-primary">
                                                                        <asp:RadioButton ID="rdbFemale" runat="server" GroupName="sex" Checked="False" />
                                                                        <span class="vs-checkbox">
                                                                            <span class="vs-checkbox--check">
                                                                                <i class="vs-icon feather icon-check"></i>
                                                                            </span>
                                                                        </span>
                                                                        <span class="">女</span>
                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                        <asp:Button class="btn btn-primary float-none btn-inline" ID="btnReset" runat="server" Text="重置" OnClick="btnReset_Click" CausesValidation="False" />
                                                        <a href="Login.aspx" class="btn btn-primary float-none btn-inline">登录</a>
                                                        <asp:Button class="btn btn-primary float-none btn-inline" ID="btnSubmit" runat="server" Text="注册" OnClick="btnSubmit_Click" />
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- END: Content-->

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
        <!-- END: Page JS-->
    </form>
</body>
</html>