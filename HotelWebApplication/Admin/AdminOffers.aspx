<%@ Page Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminOffers.aspx.cs" Inherits="HotelWebApplication.Admin.AdminOffers" Title="Admin Offers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Admin Offers</h2>
    <div class="clear"></div>
    <div class="line-hor"></div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewOffers" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="offerID" 
                DataSourceID="SqlDataSourceOffers">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="offerID" HeaderText="offerID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="offerID" />
                    <asp:BoundField DataField="offerDesc" HeaderText="offerDesc" 
                        SortExpression="offerDesc" />
                    <asp:CheckBoxField DataField="available" HeaderText="available" 
                        SortExpression="available" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceOffers" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Offers] WHERE [offerID] = @offerID" 
                InsertCommand="INSERT INTO [Offers] ([offerDesc], [available]) VALUES (@offerDesc, @available)" 
                SelectCommand="SELECT * FROM [Offers]" 
                UpdateCommand="UPDATE [Offers] SET [offerDesc] = @offerDesc, [available] = @available WHERE [offerID] = @offerID">
                <DeleteParameters>
                    <asp:Parameter Name="offerID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="offerDesc" Type="String" />
                    <asp:Parameter Name="available" Type="Boolean" />
                    <asp:Parameter Name="offerID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="offerDesc" Type="String" />
                    <asp:Parameter Name="available" Type="Boolean" />
                </InsertParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
