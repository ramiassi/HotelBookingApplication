<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="HotelWebApplication.Booking" Title="Five Star Hotel | BOOKING" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Booking</h2>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<div class="clear"></div>
<div class="line-hor"></div>
<div class="wrapper line-ver">
<div class="col-1">
    <h3>PERSONAL INFORMATION</h3>
        <table style="width: 100%;">
            <tr>
                <td>
                    Name:</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TextBoxFullName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldFullName" runat="server" 
                        ControlToValidate="TextBoxFullName" ErrorMessage="*" 
                        ValidationGroup="Booking"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Tel:</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TextBoxTel" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldTel" runat="server" 
                        ErrorMessage="*" ControlToValidate="TextBoxTel" 
                        ValidationGroup="Booking"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    E-Mail:</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldEmail" runat="server" 
                        ErrorMessage="* " ControlToValidate="TextBoxEmail" 
                        ValidationGroup="Booking"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionEmail" runat="server" 
                        ErrorMessage="×" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="TextBoxEmail" ValidationGroup="Booking"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Address:</td>
                <td>
                    <asp:TextBox ID="TextBoxAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Persons:</td>
                <td>
                    <asp:TextBox ID="TextBoxPersons" runat="server" Text="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldPersons" runat="server" 
                        ErrorMessage="*" ControlToValidate="TextBoxPersons"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionPersons" runat="server" ErrorMessage="×" ControlToValidate="TextBoxPersons" ValidationExpression="\d*" ValidationGroup="Booking"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Offer:</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSourceOffers" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [offerID], [offerDesc] FROM [Offers] WHERE ([available] = @available)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="True" Name="available" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownListOffer" runat="server" 
                        DataSourceID="SqlDataSourceOffers" DataTextField="offerDesc" 
                        DataValueField="offerID">
                    </asp:DropDownList>
                </td>
            </tr>
            </table>
            <div class="button" style="margin-top: 15px"><span><span><asp:LinkButton ID="LinkButtonCheckAvail" 
                  runat="server" Text="Check Availability" onclick="LinkButtonCheckAvail_Click">Check 
                Availability</asp:LinkButton></span></span></div>
        <asp:Panel ID="PanelAvailable" runat="server" Visible="False">                      
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl="App_Themes/Theme1/images/available.png" />
                Available                    
                  <div class="button"><span><span><asp:LinkButton ID="LinkButtonBookConfirm" 
                          runat="server" ValidationGroup="Booking" 
                          onclick="LinkButtonBookConfirm_Click">Confirm Booking</asp:LinkButton></span></span></div>
                  <div class="button"><span><span><asp:LinkButton ID="LinkButtonPrint" 
                          runat="server" Visible="false">Print Booking</asp:LinkButton></span></span></div>
                  </asp:Panel>
        <asp:Panel ID="PanelNotAvailable" runat="server" Visible="false">                      
                        <asp:Image ID="Image2" runat="server" ImageUrl="App_Themes/Theme1/images/notavailable.png" />
                        Sorry Not Available</asp:Panel>
    </div>
<div class="col-2">
    <h3>RESERVATION</h3>
        <div id="reservation-form">
          <fieldset>
              <div class="field">
                  <label>Check In:</label>
                  <asp:Calendar ID="CalendarCheckIn" runat="server">
                    <DayStyle ForeColor="White" />
                    <TitleStyle ForeColor="Black" />
                  </asp:Calendar>                      
              </div>
              <div class="field">
                <label>Check Out:</label>
                <asp:Calendar ID="CalendarCheckOut" runat="server">
                    <DayStyle ForeColor="White" />
                    <TitleStyle ForeColor="Black" />
                  </asp:Calendar>
              </div>
              <div class="field"> Room Level: &nbsp;
                  <asp:DropDownList ID="DropDownListRoomLevel" runat="server">
                      <asp:ListItem Value="1">Discounted</asp:ListItem>
                      <asp:ListItem Value="2">Business</asp:ListItem>
                      <asp:ListItem Value="3">Luxury</asp:ListItem>
                  </asp:DropDownList>
                   <br /> Room Type:&nbsp;
                  <asp:DropDownList ID="DropDownListRoomType" runat="server">                        
                      <asp:ListItem Value="1">Single</asp:ListItem>
                      <asp:ListItem Value="2">Suite</asp:ListItem>                        
                  </asp:DropDownList>
                <br />                      
              </div>
          </fieldset>
        </div>          
</div>
</div>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
