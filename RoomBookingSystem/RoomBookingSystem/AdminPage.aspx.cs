using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using DAL_Project;
namespace RoomBookingSystem
{
     
    public partial class AdminPage : System.Web.UI.Page
    {
        static string conn = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadBookings();
            }
        }

        private void loadBookings()
        {
            DAL mydal = new DAL(conn);
            GVAdminBooking.DataSource = mydal.ExecuteProcedure("spGetBookings");
            GVAdminBooking.DataBind();
        }

        protected void ButtInsertRoom_Click(object sender, EventArgs e)
        {
            PanAddRoom.Visible = true;
            txtDate.Text = "";
            txtEndTime.Text = "";
            TxtRoomName.Text = "";
            txtStartTime.Text = "";
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            PanAddRoom.Visible = false;
            DAL mydal = new DAL(conn);
            mydal.AddParam("StartTime", txtStartTime.Text);
            mydal.AddParam("EndTime", txtEndTime.Text);
            mydal.ExecuteProcedure("spUpdateBooking");
            loadBookings();
        }

        protected void GVAdminBooking_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GVAdminBooking.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            switch(e.CommandName)
            {
                case "del":
                    deleteRoom();
                    break;
                case "upd":
                    updateRoom();
                    break;
            }
        }

        private void updateRoom()
        {
            PanAddRoom.Visible = true;
            DAL mydal = new DAL(conn);
            mydal.AddParam("BookingID", GVAdminBooking.SelectedDataKey.Value.ToString());
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spGetBookings");
            txtStartTime.Text = ds.Tables[0].Rows[0]["StartTime"].ToString();
            txtEndTime.Text = ds.Tables[0].Rows[0]["EndTime"].ToString();
        }

        private void deleteRoom()
        {
            DAL mydal = new DAL(conn);
            mydal.AddParam("bookingID", GVAdminBooking.SelectedDataKey.Value.ToString());
            mydal.ExecuteProcedure("spDeleteBooking");
            loadBookings();
        }
    }
}