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
            btnadd.Visible = true;
            btnupdate.Visible = false;
            PanCapacity.Visible = true;
            lblClassroomInfo.Visible = true;
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            // Adding a new Booking //
            PanAddRoom.Visible = false;
            DAL mydal = new DAL(conn);
            mydal.AddParam("StartTime", txtStartTime.Text);
            mydal.AddParam("EndTime", txtEndTime.Text);
            mydal.AddParam("RoomName", DDLRoom.SelectedItem.Value.ToString());
            mydal.AddParam("FullName", DDLUsers.SelectedValue.ToString());
            mydal.ExecuteProcedure("spBookRoom");
            loadBookings();
        }

        protected void GVAdminBooking_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GVAdminBooking.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            switch(e.CommandName)
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
            switch(e.CommandName)
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
            BtnAddRoom.Visible = false;
            BtnUpdateRoom.Visible = true;
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
            btnadd.Visible = false;
            btnupdate.Visible = true;
            PanCapacity.Visible = false;
            DAL mydal = new DAL(conn);
            mydal.AddParam("BookingID", GVAdminBooking.SelectedDataKey.Value.ToString());
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spgetBookingUserRoom");
            txtStartTime.Text = ds.Tables[0].Rows[0]["StartTime"].ToString();
            txtEndTime.Text = ds.Tables[0].Rows[0]["EndTime"].ToString();
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
            DDLRoom.DataValueField = "RoomName";
            DDLRoom.DataTextField = "RoomName";
            DDLRoom.DataBind();
        }
        private void ddlUser()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spGetUsers");
            DDLUsers.DataSource = ds;
            DDLUsers.DataValueField = "FullName";
            DDLUsers.DataTextField = "FullName";
            DDLUsers.DataBind();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);
            mydal.AddParam("StartTime", txtStartTime.Text);
            mydal.AddParam("EndTime", txtEndTime.Text);
            mydal.AddParam("RoomName", DDLRoom.SelectedValue);
            mydal.AddParam("FullName", DDLUsers.SelectedValue);
            mydal.AddParam("BookingID", GVAdminBooking.SelectedDataKey.Value.ToString());
            mydal.ExecuteProcedure("spUpdateBooking");
            loadBookings();
        }

        protected void BtnUpdateRoom_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);
            mydal.AddParam("RoomID", GVRooms.SelectedDataKey.Value.ToString());
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
            BtnAddRoom.Visible = true;
            BtnUpdateRoom.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            PanAddRoom.Visible = false;
            lblClassroomInfo.Visible = false;
        }

        protected void BtnCancelRoom_Click(object sender, EventArgs e)
        {
            PanAddRoom.Visible = false;
        }

        protected void GVRooms_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVRooms.PageIndex = e.NewPageIndex;
            loadRooms();
        }
    }
}