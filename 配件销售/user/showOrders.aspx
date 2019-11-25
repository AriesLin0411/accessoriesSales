<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMasterPage3.master" AutoEventWireup="true" CodeFile="showOrders.aspx.cs" Inherits="user_showOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server">
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>

