<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printReservation.aspx.cs" Inherits="HotelWebApplication.printReservation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Print Reservation</title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td>
                    Reservarion ID:</td>
                <td>
                    <% if (Request.QueryString.Count > 0)
                           Response.Write(Request.QueryString[0].ToString()); %></td>
                <td>
                    Reservation Date:</td>
                <td>
                    <asp:Repeater ID="Repeater1" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("reservDate") %></ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSourceReservView" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [ViewFullReservation] WHERE ([reservID] = @reservID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="reservID" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    Check In:</td>
                <td>
                    <asp:Repeater ID="Repeater2" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("checkIn") %></ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    Check Out:</td>
                <td>
                    <asp:Repeater ID="Repeater3" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("checkOut") %></ItemTemplate>
                    </asp:Repeater></td>
            </tr>
            <tr>
                <td>
                    Persons:</td>
                <td>
                    <asp:Repeater ID="Repeater4" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("persons") %></ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" 
                    
                    style="text-align:center;border-top-width: 2px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-right-width: 2px; border-left-width: 2px; border-bottom-width: 2px; text-align: center; font-weight: bold;">
                    Personal Information</td>
            </tr>
            <tr>
                <td>
                    Full Name:</td>
                <td>
                    <asp:Repeater ID="Repeater5" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("clientFullName") %></ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    Tel:</td>
                <td>
                    <asp:Repeater ID="Repeater6" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("clientTel") %></ItemTemplate>
                    </asp:Repeater></td>
            </tr>
            <tr>
                <td>
                    Address:</td>
                <td>
                    <asp:Repeater ID="Repeater7" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("clientAddress") %></ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    Email:</td>
                <td>
                    <asp:Repeater ID="Repeater8" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("clientEmail") %></ItemTemplate>
                    </asp:Repeater></td>
            </tr>
            <tr>
                <td colspan="4" 
                    style="border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-right-width: 2px; border-left-width: 2px; text-align: center; font-weight: bold;">
                    Room Informaion</td>
            </tr>
            <tr>
                <td>
                    Room Level:</td>
                <td>
                    <asp:Repeater ID="Repeater9" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("roomLevel").ToString() == "1" ? "Discounted" : "" %>
                                      <%# Eval("roomLevel").ToString() == "2" ? "Business" : "" %>
                                      <%# Eval("roomLevel").ToString() == "3" ? "Luxury" : "" %>
                        </ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    Room Type:</td>
                <td>
                    <asp:Repeater ID="Repeater10" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("roomType").ToString() == "1" ? "Single" : "" %>
                                      <%# Eval("roomType").ToString() == "2" ? "Suite" : ""%>
                        </ItemTemplate>
                    </asp:Repeater></td>
            </tr>
            <tr>
                <td>
                    Room Number:</td>
                <td>
                    <asp:Repeater ID="Repeater11" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("roomNum").ToString() %>
                        </ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Room Description:</td>
                <td>
                    <asp:Repeater ID="Repeater12" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("roomDesc").ToString() %>
                        </ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" 
                    style="text-align: center; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 2px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; font-weight: bold">
                    &nbsp;Cost</td>
            </tr>
            <tr>
                <td>
                    Room Cost:</td>
                <td>
                    <asp:Repeater ID="Repeater13" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("roomCost").ToString() %>
                        </ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Offer:</td>
                <td>
                    <asp:Repeater ID="Repeater14" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate><%# Eval("offerDesc").ToString() %>
                        </ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Total Cost:</td>
                <td>
                    <asp:Repeater ID="Repeater15" runat="server" 
                        DataSourceID="SqlDataSourceReservView">
                        <ItemTemplate>
                            <%# Eval("TotalCost").ToString() %>
                        </ItemTemplate>
                    </asp:Repeater></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <input id="Button1" type="button" value="Print" onclick="window.print()"/></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
