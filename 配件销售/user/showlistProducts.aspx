<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMasterPage.master" AutoEventWireup="true" CodeFile="showlistProducts.aspx.cs" Inherits="user_showlistProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;

                <asp:ListView ID="ListView1" runat="server">
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

            </td>
            <td>&nbsp;

                <asp:ListView ID="ListView2" runat="server">
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>

