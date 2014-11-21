using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

namespace HotelWebApplication
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //CalendarCheckIn.SelectedDate = 
            //    CalendarCheckOut.SelectedDate = DateTime.Today;
        }

        protected void LinkButtonCheckAvail_Click(object sender, EventArgs e)
        {
            DateTime checkIn = CalendarCheckIn.SelectedDate;
            DateTime checkOut = CalendarCheckOut.SelectedDate;
            int roomLevel = Convert.ToInt32(DropDownListRoomLevel.SelectedValue);
            int roomType = Convert.ToInt32(DropDownListRoomType.SelectedValue);
            if (new DBCode.DBHelper().CheckAvailability(checkIn, checkOut, roomLevel, roomType) > 0)
            {
                LinkButtonBookHere.PostBackUrl = "Booking.aspx?in=" +
                    CalendarCheckIn.SelectedDate.ToShortDateString() +
                    "&out=" + CalendarCheckOut.SelectedDate.ToShortDateString() +
                    "&roomLevel=" + DropDownListRoomLevel.SelectedIndex +
                    "&roomType=" + DropDownListRoomType.SelectedIndex;
                PanelAvailable.Visible = true;
                PanelNotAvailable.Visible = false;
            }
            else
            {
                PanelAvailable.Visible = false;
                PanelNotAvailable.Visible = true;
            }            
        }
    }
}
