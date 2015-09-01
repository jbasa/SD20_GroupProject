using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;
using System.Configuration;
namespace RoomBookingSystem
{
    public partial class RoomBookingSystem : System.Web.UI.MasterPage
    {
        string conn = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string test = txtPass.Text;
            Security mySecurity = new Security();
            if (mySecurity.IsLoggedIn())
            {
                loginLink.Style.Add("display", "none");
                registerLink.Style.Add("display", "none");
                settingsLink.Visible = true;
                hlAdmin.Visible = true;
                hlLogout.Visible = true;

                pnlUserSettings.Visible = true;
                //settingsLink.Attributes.Add("onclick", "pnlVisibleTrue()");
                int UserID = mySecurity.UserID;
                LoadUserInfo(UserID);

                lblWelcome.Text = "Welcome " + mySecurity.FullName + "!";
            }
        }

        private void pnlVisibleTrue()
        {
            pnlUserSettings.Visible = true;
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
            Security mySecurity = new Security();
            DAL myDal = new DAL(conn);
            int UserID = mySecurity.UserID;
            myDal.AddParam("@UserID", UserID);
            myDal.AddParam("@FullName", txtFullName.Text);
            myDal.AddParam("@Email", txtEmail.Text);
            myDal.AddParam("@Password", txtPass.Text);
            myDal.ExecuteProcedure("spUpdateUser");
            pnlUserSettings.Visible = false;
        }

        private void LoadUserInfo(int UserID)
        {
            DAL myDal = new DAL(conn);
            myDal.AddParam("@UserID", UserID);
            DataSet dsUser = new DataSet();
            dsUser = myDal.ExecuteProcedure("spGetUsers");

            if (txtPass.Text == "")
            {
                txtFullName.Text = dsUser.Tables[0].Rows[0]["FullName"].ToString();
                txtPass.Text = dsUser.Tables[0].Rows[0]["Password"].ToString();
                txtEmail.Text = dsUser.Tables[0].Rows[0]["Email"].ToString();
            }
           
        }
    }
}