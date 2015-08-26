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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            DAL myDal = new DAL(conn);
            DataSet dsRegister = new DataSet();
            myDal.AddParam("@FullName", txtFullName.Text);
            myDal.AddParam("@Email", txtEmail.Text);
            myDal.AddParam("@Password", txtPassword.Text);
            dsRegister = myDal.ExecuteProcedure("spCreateUser");

            if (dsRegister.Tables[0].Rows[0]["Message"].ToString() == "Error")
            {
                lblMessage.Text = "Error account has already been created";
                lblMessage.ForeColor = System.Drawing.Color.Red;

            }
            else
            {
                lblMessage.Text = "User Created";
                lblMessage.Text = "A confirmation email has been sent to your email address";
            }


        }
    }
}