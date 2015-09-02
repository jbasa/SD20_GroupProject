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
            Security mySecurity = new Security();
            if (!mySecurity.IsAdmin())
            {
                Response.Redirect("Index.aspx");
            }
            if (!IsPostBack)
            {
                loadBookings();
                ddlRoom();
                ddlUser();
                loadRooms();
                LoadFloors();
            }
        }

        private void loadRooms()
        {
            DAL mydal = new DAL(conn);
            GVRooms.DataSource = mydal.ExecuteProcedure("spGetRoom");
            GVRooms.DataBind();
        }

        private void loadBookings()
        {
            DAL mydal = new DAL(conn);
            GVAdminBooking.DataSource = mydal.ExecuteProcedure("spgetBookingUserRoom");
            GVAdminBooking.DataBind();
        }
        private void LoadFloors()
        {
            DAL myDal = new DAL(conn);
            DDLFloor.DataSource = myDal.ExecuteProcedure("spGetFloors");
            DDLFloor.DataTextField = "FloorNumber";
            DDLFloor.DataValueField = "FloorID";
            DDLFloor.DataBind();

        }

        protected void ButtInsertRoom_Click(object sender, EventArgs e)
        {
            // Adding a new Booking //
            PanAddRoom.Visible = true;
            txtDate.Text = "";
            txtEndTime.Text = "";
            txtStartTime.Text = "";
            BtnAddRoom.Visible = true;
            BtnUpdateRoom.Visible = false;
            lblClassroomInfo.Visible = true;
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            // Adding a new Booking //
            PanAddRoom.Visible = false;
            DAL mydal = new DAL(conn);
            DateTime StartTime = DateTime.Parse(txtDate.Text + " " + txtStartTime.Text);
            DateTime EndTime = DateTime.Parse(txtDate.Text + " " + txtEndTime.Text);
            mydal.AddParam("StartTime", StartTime);
            mydal.AddParam("EndTime", EndTime);
            mydal.AddParam("RoomID", DDLRoom.SelectedValue);
            mydal.AddParam("UserID", DDLUsers.SelectedValue);
            mydal.ExecuteProcedure("spBookRoom");
            loadBookings();
            PanAddRoom.Visible = false;
        }

        protected void GVAdminBooking_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GVAdminBooking.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            switch (e.CommandName)
            {
                case "del":
                    deleteBooking();
                    break;
                case "upd":
                    getBookinginfo();
                    break;
            }
        }
        protected void GVRooms_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GVRooms.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            switch (e.CommandName)
            {
                case "del":
                    deleteroom();
                    break;
                case "Upd":
                    RoomInfo();
                    break;

            }
        }
        private void deleteroom()
        {
            DAL mydal = new DAL(conn);
            mydal.AddParam("RoomID", GVRooms.SelectedDataKey.Value.ToString());
            mydal.ExecuteProcedure("spDeleteRoom");
            loadRooms();
        }

        private void RoomInfo()
        {
            PanRoom.Visible = true;
            btnadd.Visible = false;
            btnupdate.Visible = true;
            DAL mydal = new DAL(conn);
            mydal.AddParam("RoomID", GVRooms.SelectedDataKey.Value.ToString());
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spGetRoom");
            txtRoomName.Text = ds.Tables[0].Rows[0]["RoomName"].ToString();
        }

        private void getBookinginfo()
        {
            // info for Updateing a Booking //
            PanAddRoom.Visible = true;
            BtnAddRoom.Visible = false;
            BtnUpdateRoom.Visible = true;
            DAL mydal = new DAL(conn);
            mydal.AddParam("BookingID", GVAdminBooking.SelectedDataKey.Value.ToString());
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spgetBookingUserRoom");
            DDLRoom.SelectedValue = ds.Tables[0].Rows[0]["RoomID"].ToString();
            txtStartTime.Text = ds.Tables[0].Rows[0]["StartTime"].ToString();
            txtEndTime.Text = ds.Tables[0].Rows[0]["EndTime"].ToString();
            DDLUsers.SelectedValue = ds.Tables[0].Rows[0]["UserID"].ToString();
        }

        private void deleteBooking()
        {
            DAL mydal = new DAL(conn);
            mydal.AddParam("bookingID", GVAdminBooking.SelectedDataKey.Value.ToString());
            mydal.ExecuteProcedure("spDeleteBooking");
            loadBookings();
        }
        private void ddlRoom()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spGetRoomName");
            DDLRoom.DataSource = ds;
            DDLRoom.DataValueField = "RoomID";
            DDLRoom.DataTextField = "RoomName";
            DDLRoom.DataBind();
        }
        private void ddlUser()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spGetUsers");
            DDLUsers.DataSource = ds;
            DDLUsers.DataValueField = "UserID";
            DDLUsers.DataTextField = "FullName";
            DDLUsers.DataBind();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);
            DataSet dsUpdate = new DataSet();
            DateTime StartTime = DateTime.Parse(txtDate.Text + " " + txtStartTime.Text);
            DateTime EndTime = DateTime.Parse(txtDate.Text + " " + txtEndTime.Text);
            mydal.AddParam("StartTime", StartTime);
            mydal.AddParam("EndTime", EndTime);
            mydal.AddParam("RoomID", DDLRoom.SelectedValue);
            mydal.AddParam("UserID", DDLUsers.SelectedValue);
            mydal.AddParam("BookingID", GVAdminBooking.SelectedDataKey.Value);
            dsUpdate = mydal.ExecuteProcedure("spUpdateBooking");
            loadBookings();
            PanAddRoom.Visible = false;
        }

        protected void BtnUpdateRoom_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);

            mydal.AddParam("RoomID", GVRooms.SelectedDataKey.Value);
            mydal.AddParam("RoomName", txtRoomName.Text);
            mydal.AddParam("NumberOfChairs", DDLCap.SelectedValue);
            mydal.ExecuteProcedure("spUpdateRoom");
            PanRoom.Visible = false;
            loadRooms();
        }


        protected void BtnInsertRoom_Click(object sender, EventArgs e)
        {
            PanRoom.Visible = true;
            PanFloor.Visible = true;
            txtRoomName.Text = "";
            btnadd.Visible = true;
            btnupdate.Visible = false;
        }

        protected void BtnCancelBooking_Click(object sender, EventArgs e)
        {
            PanAddRoom.Visible = false;
            lblClassroomInfo.Visible = false;
        }

        protected void BtnCancelRoom_Click(object sender, EventArgs e)
        {
            PanRoom.Visible = false;
        }

        protected void GVRooms_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVRooms.PageIndex = e.NewPageIndex;
            loadRooms();
        }
    }
}