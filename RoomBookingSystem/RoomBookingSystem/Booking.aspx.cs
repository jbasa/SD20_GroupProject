using System;
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

        }
    }
}