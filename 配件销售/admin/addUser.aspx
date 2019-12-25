<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="addUser.aspx.cs" Inherits="admin_addUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <section>
        <div class="card">
            <div class="card-header">
                <div class="card-title-wrap bar-success">
                    <h4 class="card-title">填写用户信息</h4>
                </div>
            </div>
            <div class="card-body">
                <div class="card-block">
                    
                    <div class="row">
                        <div class="card-block">
                            <ul class="list-group">
                                <li class="list-group-item">用户名:<asp:TextBox ID="TextBox1" runat="server" BorderStyle="None"></asp:TextBox></li>
                                <li class="list-group-item">密码:<asp:TextBox ID="TextBox2" runat="server" BorderStyle="None"></asp:TextBox></li>
                                <li class="list-group-item">性别:<asp:TextBox ID="TextBox3" runat="server" BorderStyle="None"></asp:TextBox></li>
                                <li class="list-group-item">身份证号:<asp:TextBox ID="TextBox4" runat="server" BorderStyle="None"></asp:TextBox></li>
                            </ul>
                        </div>
                    </div>

                    <div class="row">
                        <div class="card-block">
                            <asp:Button ID="btnChange" runat="server" Text="添加" CssClass="btn gradient-indigo-blue white card-shadow" OnClick="btnChange_Click" />
                        </div>

                        </div>

                </div>
            </div>
        </div>
    </section>

</asp:Content>

