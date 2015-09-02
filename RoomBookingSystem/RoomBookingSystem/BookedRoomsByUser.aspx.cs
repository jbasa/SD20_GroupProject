using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoomBookingSystem
{
    public partial class BookedRoomsByUser : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        Security mySecurity = new Security();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadgvUserBookedRooms();   
            }
        }

        public void loadgvUserBookedRooms()
        {
            DAL d = new DAL(conn);
            d.AddParam("@UserID", mySecurity.UserID);
            gvUserBookedRooms.DataSource = d.ExecuteProcedure("spGetBookingsForUser");
            gvUserBookedRooms.DataBind();
        }
    }
}