using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL_Project;
using System.Configuration;
using System.Data;
namespace RoomBookingSystem
{
    public class Security
    {
        string conn = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        public string FullName;
        public Security()
        {
            if (HttpContext.Current.Session["FullName"] == null)
            {
                FullName = "";
            }
            else
            {
                FullName = HttpContext.Current.Session["FullName"].ToString();
            }
        }

        public bool Login(string FullName, string Password)
        {
            DAL myDal = new DAL(conn);
            DataSet dsLogin = new DataSet();
            myDal.AddParam("@FullName", FullName);
            myDal.AddParam("@Password", Password);
            dsLogin = myDal.ExecuteProcedure("spLogin");

            if (dsLogin.Tables[0].Rows.Count == 0)
            {
                return false;
            }

            FullName = dsLogin.Tables[0].Rows[0]["FullName"].ToString();
            HttpContext.Current.Session["FullName"] = FullName; 

            return true;
        }

        public bool IsClient()
        {
            if (HttpContext.Current.Session["FullName"] == null)
            {
                return false;
            }
            return true;
        }

        public bool IsAdmin()
        {
            if (HttpContext.Current.Session["FullName"] == null)
            {
                return false;
            }
            else
            {
                if (HttpContext.Current.Session["FullName"].ToString() == "Admin")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        internal static void LogOut()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
        }
    }
}