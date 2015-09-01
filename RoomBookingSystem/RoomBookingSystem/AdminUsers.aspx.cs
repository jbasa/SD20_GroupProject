using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using DAL_Project;
using System.Data;
namespace RoomBookingSystem
{
    public partial class AdminUsers : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Security mySecurity = new Security();
            if (!mySecurity.IsAdmin())
            {
                Response.Redirect("Index.aspx");
            }
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            DAL myDal = new DAL(conn);
            gvUsers.DataSource = myDal.ExecuteProcedure("spGetUsers");
            gvUsers.DataBind();
        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsers.PageIndex = e.NewPageIndex;
            LoadUsers();
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                gvUsers.SelectedIndex = Convert.ToInt32(e.CommandArgument);
                int UserID = (int)gvUsers.SelectedDataKey.Value;

                if (e.CommandName == "upd")
                {
                    PopulateFields(UserID);
                    btnUpdate.Visible = true;
                    btnSave.Visible = false;
                    //LoadUsers();
                }
                else if (e.CommandName == "del")
                {
                    DAL myDal = new DAL(conn);
                    myDal.AddParam("@UserID", UserID);
                    myDal.ExecuteProcedure("spDeleteUser");
                    LoadUsers();
                    ResetFields();
                }

            }
        }

        private void ResetFields()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            ddlSecurityLevel.SelectedValue = "";
        }

        private void PopulateFields(int UserID)
        {
            LoadUserByID(UserID);
            pnlRight.Visible = true;

        }

        private void LoadUserByID(int UserID)
        {
            DAL myDal = new DAL(conn);
            myDal.AddParam("@UserID", gvUsers.SelectedDataKey.Value);
            DataSet dsUser = new DataSet();
            dsUser = myDal.ExecuteProcedure("spGetUsers");
            DataRow row = dsUser.Tables[0].Rows[0];
            txtFullName.Text = row["FullName"].ToString();
            txtEmail.Text = row["Email"].ToString();
            txtPassword.Text = row["Password"].ToString();
            ddlSecurityLevel.SelectedValue = row["SecurityLevel"].ToString();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlRight.Visible = false;
            lblUserInfoLabel.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DAL myDal = new DAL(conn);
            DataSet dsAdd = new DataSet();
            myDal.AddParam("@FullName", txtFullName.Text);
            myDal.AddParam("@Email", txtEmail.Text);
            myDal.AddParam("@Password", txtPassword.Text);
            myDal.AddParam("@SecurityLevel", int.Parse(ddlSecurityLevel.SelectedValue));
            dsAdd = myDal.ExecuteProcedure("spAdminCreateUser");
            LoadUsers();
            pnlRight.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DAL myDal = new DAL(conn);
            DataSet dsUpdate = new DataSet();
            myDal.AddParam("@UserID", gvUsers.SelectedDataKey.Value);
            myDal.AddParam("@FullName", txtFullName.Text);
            myDal.AddParam("@Email", txtEmail.Text);
            myDal.AddParam("@Password", txtPassword.Text);
            myDal.AddParam("@SecurityLevel", int.Parse(ddlSecurityLevel.SelectedValue));
            dsUpdate = myDal.ExecuteProcedure("spAdminUpdateUser");
            LoadUsers();
            pnlRight.Visible = false;

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            pnlRight.Visible = true;
            ResetFields();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
            lblUserInfoLabel.Visible = true;
        }
    }
}