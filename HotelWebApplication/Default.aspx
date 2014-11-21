<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HotelWebApplication.Default" Title="Five Star Hotel | HOME" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>FiveStar is happy to welcome you!</h2>
          <img class="img-indent png" alt="" 
    src="App_Themes/Theme1/images/1page-img1.png" />
          <p class="alt-top">Come alone or bring your family with you, stay here for a night 
              or for weeks, stay here while on business trip or at some kind of conference - 
              either way our hotel is the best possible variant.</p>
          Feel free to contact us anytime in case you have any questions or 
concerns.
          <div class="clear"></div>
          <div class="line-hor"></div>
          <div class="wrapper line-ver">
            <div class="col-1">
              <h3>Special Offers</h3>
              <ul>
                  <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceOffers">
                    <ItemTemplate>
                        <li><%# Eval("offerDesc") %></li>
                    </ItemTemplate>
                  </asp:Repeater>
                  <asp:SqlDataSource ID="SqlDataSourceOffers" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                      
                      SelectCommand="SELECT [offerDesc] FROM [Offers] WHERE ([available] = @available)">
                      <SelectParameters>
                          <asp:Parameter DefaultValue="True" Name="available" Type="Boolean" />
                      </SelectParameters>
                  </asp:SqlDataSource>
              </ul>
              <div class="button"><span><span><a href="Booking.aspx">Book Now!</a></span></span></div>
            </div>
            <div class="col-2">
              <h3>Location</h3>
              <p>We are located in the center of Prague surrounded by malls and boutiques.</p>
              <dl class="contacts-list">
                <dt>Gazek st., 210</dt>
                <dd>1-800-412-4556</dd>
                <dd>1-800-542-6448</dd>
              </dl>
            </div>
          </div>
</asp:Content>
