using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;
using System.Configuration;
using System.Net.Mail;
namespace RoomBookingSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
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
                    lblMessage.Text = "User Created, Please go to Log In to continue";
                    //ConfirmationEmail();
                    //lblEmail.Text = "A confirmation email has been sent to your email address";
                }
            }
        


        }

        private void ConfirmationEmail()
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("adam.kuharski@robertsoncollege.net");
            message.To.Add(new MailAddress(txtEmail.Text));
            message.Subject = "Your account has been registered";
            message.Body = "Thank you for registering with Robertson College Room Booking. Your Full Name is: " + " "
                + txtFullName.Text + " " + "and Password is: " + " " + txtPassword.Text;
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential
            ("adam.kuharski@robertsoncollege.net", "Kevindurant35");
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(message);
        }
    }
}