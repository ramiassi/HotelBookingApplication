using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace HotelWebApplication
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0 && !IsPostBack)
            {
                CalendarCheckIn.SelectedDate = DateTime.Parse(Request.QueryString["in"].ToString());
                CalendarCheckOut.SelectedDate = DateTime.Parse(Request.QueryString["out"].ToString());
                DropDownListRoomLevel.SelectedIndex =  Convert.ToInt32(Request.QueryString["roomLevel"]);
                DropDownListRoomType.SelectedIndex = Convert.ToInt32(Request.QueryString["roomType"]);
            }  
        }


        protected void LinkButtonCheckAvail_Click(object sender, EventArgs e)
        {
            DateTime checkIn = CalendarCheckIn.SelectedDate;
            DateTime checkOut = CalendarCheckOut.SelectedDate;
            int roomLevel = Convert.ToInt32(DropDownListRoomLevel.SelectedValue);
            int roomType = Convert.ToInt32(DropDownListRoomType.SelectedValue);
            int availableRoomID = new DBCode.DBHelper().CheckAvailability(checkIn, checkOut, roomLevel, roomType);
            if ( availableRoomID > 0)
            {
                if (Session["availableRoomID"] == null)
                {
                    Session.Add("availableRoomID", availableRoomID);
                }
                else
                {
                    Session["availableRoomID"] = availableRoomID;
                }
                PanelAvailable.Visible = true;
                PanelNotAvailable.Visible = false;
            }
            else
            {
                PanelAvailable.Visible = false;
                PanelNotAvailable.Visible = true;
            }
        }

        protected void LinkButtonBookConfirm_Click(object sender, EventArgs e)
        {
            int reservID = new DBCode.DBHelper().InsertReservation(
                CalendarCheckIn.SelectedDate,
                CalendarCheckOut.SelectedDate,
                (int)Session["availableRoomID"],
                Convert.ToInt32(TextBoxPersons.Text),
                TextBoxFullName.Text,
                TextBoxTel.Text,
                TextBoxEmail.Text,
                TextBoxAddress.Text,
                Convert.ToInt32(DropDownListOffer.SelectedValue),
                DateTime.Now);
            if (reservID > 0)
            {
                LinkButtonPrint.PostBackUrl = "printReservation.aspx?id=" + reservID;
                LinkButtonPrint.Visible = true;
            }
            else
            {
                LinkButtonPrint.Visible = false;
            }
        }

    }
}
