<%@ Page Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminRooms.aspx.cs" Inherits="HotelWebApplication.Admin.AdminRooms" Title="Admin Rooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Admin Rooms</h2>
    <div class="clear"></div>
    <div class="line-hor"></div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        AllowPaging="True" AutoGenerateRows="False" DataKeyNames="roomID" 
        DataSourceID="SqlDataSourceRooms" Caption="Current Rooms">
        <Fields>
            <asp:BoundField DataField="roomID" HeaderText="roomID" InsertVisible="False" 
                ReadOnly="True" SortExpression="roomID" />
            <asp:TemplateField HeaderText="roomLevel" SortExpression="roomLevel">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        SelectedValue='<%# Bind("roomLevel") %>'>
                        <asp:ListItem Value="1">Discounted</asp:ListItem>
                        <asp:ListItem Value="2">Business</asp:ListItem>
                        <asp:ListItem Value="3">Luxury</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        SelectedValue='<%# Bind("roomLevel") %>'>
                        <asp:ListItem Value="1">Discounted</asp:ListItem>
                        <asp:ListItem Value="2">Business</asp:ListItem>
                        <asp:ListItem Value="3">Luxury</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" 
                        SelectedValue='<%# Eval("roomLevel") %>'>
                        <asp:ListItem Value="1">Discounted</asp:ListItem>
                        <asp:ListItem Value="2">Business</asp:ListItem>
                        <asp:ListItem Value="3">Luxury</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="roomType" SortExpression="roomType">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        SelectedValue='<%# Bind("roomType") %>'>
                        <asp:ListItem Value="1">Single</asp:ListItem>
                        <asp:ListItem Value="2">Suite</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        SelectedValue='<%# Bind("roomType") %>'>
                        <asp:ListItem Value="1">Single</asp:ListItem>
                        <asp:ListItem Value="2">Suite</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" Enabled="False" 
                        SelectedValue='<%# Eval("roomType") %>'>
                        <asp:ListItem Value="1">Single</asp:ListItem>
                        <asp:ListItem Value="2">Suite</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="roomNum" HeaderText="roomNum" 
                SortExpression="roomNum" />
            <asp:BoundField DataField="bedCount" HeaderText="bedCount" 
                SortExpression="bedCount" />
            <asp:BoundField DataField="roomDesc" HeaderText="roomDesc" 
                SortExpression="roomDesc" />
            <asp:BoundField DataField="roomCost" HeaderText="roomCost" 
                SortExpression="roomCost" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceRooms" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Rooms] WHERE [roomID] = @roomID" 
        InsertCommand="INSERT INTO [Rooms] ([roomLevel], [roomType], [roomNum], [bedCount], [roomDesc], [roomCost]) VALUES (@roomLevel, @roomType, @roomNum, @bedCount, @roomDesc, @roomCost)" 
        SelectCommand="SELECT * FROM [Rooms]" 
        UpdateCommand="UPDATE [Rooms] SET [roomLevel] = @roomLevel, [roomType] = @roomType, [roomNum] = @roomNum, [bedCount] = @bedCount, [roomDesc] = @roomDesc, [roomCost] = @roomCost WHERE [roomID] = @roomID">
        <DeleteParameters>
            <asp:Parameter Name="roomID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="roomLevel" Type="Int32" />
            <asp:Parameter Name="roomType" Type="Int32" />
            <asp:Parameter Name="roomNum" Type="Int32" />
            <asp:Parameter Name="bedCount" Type="Int32" />
            <asp:Parameter Name="roomDesc" Type="String" />
            <asp:Parameter Name="roomCost" Type="Decimal" />
            <asp:Parameter Name="roomID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="roomLevel" Type="Int32" />
            <asp:Parameter Name="roomType" Type="Int32" />
            <asp:Parameter Name="roomNum" Type="Int32" />
            <asp:Parameter Name="bedCount" Type="Int32" />
            <asp:Parameter Name="roomDesc" Type="String" />
            <asp:Parameter Name="roomCost" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
