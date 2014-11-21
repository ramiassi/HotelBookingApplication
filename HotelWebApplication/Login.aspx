<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HotelWebApplication.Admin.Login" Title="Admin Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>Admin Login</h2>
    <div class="clear"></div>
    <div class="line-hor"></div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;">
                <tr>
                    <td>
                        &nbsp; username:</td>
                    <td>
                        &nbsp;
                        <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" 
                            ControlToValidate="TextBoxUsername" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; password:</td>
                    <td>
                        &nbsp;
                        <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" 
                            ControlToValidate="TextBoxPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Login" onclick="Button1_Click" />
                    </td>
                    <td>
                        &nbsp;
                        <asp:Label ID="LabelError" runat="server" ForeColor="Red" 
                            Text="username or password is not correct, try again!" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>  
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
