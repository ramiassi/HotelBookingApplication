using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace HotelWebApplication.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int adminID = new DBCode.DBHelper().CheckAdminLogin(TextBoxUsername.Text, TextBoxPassword.Text);
            if (adminID > 0)
            {
                Session.Add("adminID", adminID);
                Response.Redirect("Admin/AdminOffers.aspx");
            }
            else
            {
                LabelError.Visible = true;
            }
        }
    }
}
