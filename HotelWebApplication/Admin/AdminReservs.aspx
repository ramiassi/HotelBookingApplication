<%@ Page Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminReservs.aspx.cs" Inherits="HotelWebApplication.Admin.AdminReservs" Title="Admin Reservations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Admin Reservations</h2>
    <div class="clear"></div>
    <div class="line-hor"></div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewReservs" runat="server" 
                DataSourceID="SqlDataSourceReservs" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" Caption="Current Reservations">
                <Columns>
                    <asp:BoundField DataField="reservID" HeaderText="reservID" 
                        SortExpression="reservID" />
                    <asp:BoundField DataField="reservDate" HeaderText="reservDate" 
                        SortExpression="reservDate" />
                    <asp:BoundField DataField="checkIn" HeaderText="checkIn" 
                        SortExpression="checkIn" />
                    <asp:BoundField DataField="checkOut" HeaderText="checkOut" 
                        SortExpression="checkOut" />
                    <asp:BoundField DataField="roomNum" HeaderText="roomNum" 
                        SortExpression="roomNum" />
                    <asp:BoundField DataField="clientFullName" HeaderText="clientFullName" 
                        SortExpression="clientFullName" />
                    <asp:BoundField DataField="clientTel" HeaderText="clientTel" 
                        SortExpression="clientTel" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("reservID", "~/printReservation.aspx?id={0}") %>' Text="View"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceReservs" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT [reservID], [reservDate], [checkIn], [checkOut], [roomNum], [clientFullName], [clientTel] FROM [ViewFullReservation] ORDER BY [reservDate] DESC"></asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
