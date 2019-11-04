<%@ Page Title="" Language="C#" MasterPageFile="adminMasterPage.master" AutoEventWireup="true" CodeFile="addPClass.aspx.cs" Inherits="admin_addPClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtPClass" runat="server"></asp:TextBox>
    <asp:Button ID="btnAdd" runat="server" Text="增加" OnClick="btnAdd_Click" />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
</asp:Content>

