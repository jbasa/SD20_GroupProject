﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;

namespace RoomBookingSystem
{
    public partial class Booking : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFloors();
            }
        }

        private void LoadFloors()
        {
            DAL myDal = new DAL(conn);
            ddlFloor.DataSource = myDal.ExecuteProcedure("spGetFloors");
            ddlFloor.DataTextField = "FloorNumber";
            ddlFloor.DataValueField = "FloorID";
            ddlFloor.DataBind();

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Security mySecurity = new Security();
            if (!mySecurity.IsClient())
            {
                Response.Redirect("Booking.aspx?MustLogIn=true");
            }
            else
            {
                DAL myDal = new DAL(conn);
                DateTime StartTime = DateTime.Parse(txtDate.Text + " " + txtStartTime.Text);
                DateTime EndTime = DateTime.Parse(txtDate.Text + " " + txtEndTime.Text);
                myDal.AddParam("@FloorNumber", ddlFloor.SelectedValue);
                myDal.AddParam("@NumberOfChairs", ddlCapacity.SelectedValue);
                myDal.AddParam("@StartTime", StartTime);
                myDal.AddParam("@EndTime", EndTime);
                gvAvailableRooms.DataSource = myDal.ExecuteProcedure("spSearch");
                gvAvailableRooms.DataBind();
            }

        }

        protected void gvAvailableRooms_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            gvAvailableRooms.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "book")
            {

            }
        }
    }
}