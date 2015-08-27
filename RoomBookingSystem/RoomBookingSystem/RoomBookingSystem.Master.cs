using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoomBookingSystem
{
    public partial class RoomBookingSystem : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Security mySecurity = new Security();
            if (mySecurity.IsLoggedIn())
            {
                loginLink.Style.Add("display", "none");
                registerLink.Style.Add("display", "none");
                settingsLink.Visible = true;
                hlAdmin.Visible = true;
                hlLogout.Visible = true;
            }
        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            Security mySecurity = new Security();
            if (mySecurity.Login(txtUsername.Text, txtPassword.Text))
            {
                if (mySecurity.IsAdmin())
                {
                    Response.Redirect("Index.aspx");
                }
                else if (mySecurity.IsClient())
                {
                    Response.Redirect("Booking.aspx");
                }
            }
            else
            {
                
            }
        }

        protected void hlLogout_Click(object sender, EventArgs e)
        {
            Security.LogOut();
            Response.Redirect("Index.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
    }
}