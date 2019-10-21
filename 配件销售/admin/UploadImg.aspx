<%@ Page Title="" Language="C#" MasterPageFile="adminMasterPage.master" AutoEventWireup="true" CodeFile="UploadImg.aspx.cs" Inherits="admin_UploadImg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;height:400px;">
    <tr>
        <td align="right">已有图片</td>
        <td>&nbsp;
            <asp:DropDownList ID="ddlImg" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlImg_SelectedIndexChanged"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right">图片预览</td>
        <td>&nbsp;
            <asp:Image ID="Image1" runat="server" Width="382px" Height="200px" />
        </td>
    </tr>
    <tr>
        <td class="auto-style1" align="right">图片名</td>
        <td class="auto-style1">&nbsp;
            <asp:TextBox ID="txtImgName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">本地路径</td>
        <td>&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;
            <asp:Label ID="lblInfo" runat="server"></asp:Label><br />
            <asp:Button ID="btnSubmit" runat="server" Text="上传图片" OnClick="btnSubmit_Click" />
        </td>
    </tr>
</table>
</asp:Content>


