<%@ Page Title="" Language="C#" MasterPageFile="adminMasterPage.master" AutoEventWireup="true" CodeFile="addProducts.aspx.cs" Inherits="admin_addProducts" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 221px;
            text-align:center;
        }
    .auto-style2 {
        height: 27px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;text-align:center;">
        <tr>
            <td width="20%">&nbsp;</td>
            <td width="80%">&nbsp;

                商品增加</td>
        </tr>
        <tr>
            <td>商品名称</td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>商品图片</td>
            <td>
                <asp:DropDownList ID="ddlImg" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlImg_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:Image ID="Img1" runat="server" Height="56px" Width="64px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">商品价格</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>商品类别</td>
            <td>
                <asp:DropDownList ID="ddlClass" runat="server" DataSourceID="SqlDataSource1" DataTextField="cName" DataValueField="cId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db17135111ConnectionString %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                <asp:Button ID="btnAddclass" runat="server" OnClick="btnAddclass_Click" Text="增加类别" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">录入时间</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtTime" runat="server"></asp:TextBox>
                <asp:ImageButton ID="imgbtnCalendar" runat="server" ImageUrl="~/images/calendar alt-fill.png" OnClick="imgbtnCalendar_Click" ImageAlign="AbsMiddle" />
                <br /><div style="margin: 0px auto 0px auto;display:inline-block;">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar></div>
            </td>
        </tr>
        <tr>
            <td>商品简述</td>
            <td>
                <asp:TextBox ID="txtDescribe" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>商品详情</td>
            <td>&nbsp;<CKEditor:CKEditorControl ID="CKEditor1" runat="server" Height="149px"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;
                <asp:Button ID="btnSubmmit" runat="server" Text="增加" OnClick="btnSubmmit_Click" />
                <asp:Button ID="btnReset" runat="server" Text="重置" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

