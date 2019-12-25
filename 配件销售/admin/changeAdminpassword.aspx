<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="changeAdminpassword.aspx.cs" Inherits="admin_changeUserpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section>
        <div class="card">
            <div class="card-header">
                <div class="card-title-wrap bar-success">
                    <h4 class="card-title">查询条件</h4>
                </div>
            </div>
            <div class="card-body">
                <div class="card-block">

                    <div class="col-xl-4 col-lg-6 col-md-12">
                        <fieldset class="form-group">
                            <label for="basicSelect">请输入管理员名:</label>
                            <asp:TextBox ID="txtCarnum" runat="server" class="form-control"></asp:TextBox>
                        </fieldset>
                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="btn gradient-indigo-blue white card-shadow" OnClick="btnSearch_Click" />
                    </div>


                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="card">
            <div class="card-header">
                <div class="card-title-wrap bar-success">
                    <h4 class="card-title">查询结果</h4>
                </div>
            </div>
            <div class="card-body">
                <div class="card-block">


                    <div class="row">
                        <div class="card-block">
                            <ul class="list-group">
                                <li class="list-group-item">姓名:<asp:TextBox ID="TextBox1" runat="server" BorderStyle="None"></asp:TextBox></li>
                                <li class="list-group-item">新密码:<asp:TextBox ID="TextBox2" runat="server" BorderStyle="None"></asp:TextBox></li>
                            </ul>
                        </div>
                    </div>

                    <div class="row">
                        <div class="card-block">
                            <asp:Button ID="btnChange" runat="server" Text="修改" CssClass="btn gradient-indigo-blue white card-shadow" OnClick="btnChange_Click" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

</asp:Content>

