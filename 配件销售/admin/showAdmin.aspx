<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMasterPage.master" AutoEventWireup="true" CodeFile="showAdmin.aspx.cs" Inherits="admin_showProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT [adminName], [adminSex], [adminPassword], [adminPhonenumber], [adminEmail] FROM [admin] WHERE ([adminName] = @adminName)">
        <SelectParameters>
            <asp:QueryStringParameter Name="adminName" QueryStringField="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="adminName" DataSourceID="SqlDataSource1">

        <ItemTemplate>
            <span style="">adminName:
            <asp:Label ID="adminNameLabel" runat="server" Text='<%# Eval("adminName") %>' />
            <br />
            adminSex:
            <asp:Label ID="adminSexLabel" runat="server" Text='<%# Eval("adminSex") %>' />
            <br />
            adminPassword:
            <asp:Label ID="adminPasswordLabel" runat="server" Text='<%# Eval("adminPassword") %>' />
            <br />
            adminPhonenumber:
            <asp:Label ID="adminPhonenumberLabel" runat="server" Text='<%# Eval("adminPhonenumber") %>' />
            <br />
            adminEmail:
            <asp:Label ID="adminEmailLabel" runat="server" Text='<%# Eval("adminEmail") %>' />
            <br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div style="" id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>

