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
        public int UserID
        {
            get
            {
                return HttpContext.Current.Session["UserID"] == null ? -1 : Convert.ToInt32(HttpContext.Current.Session["UserID"].ToString());
            }
        }
        public string FullName
        {
            get
            {
                return HttpContext.Current.Session["FullName"] == null ? null : HttpContext.Current.Session["FullName"].ToString(); 
            }
        }
        public int SecurityLevel
        {
            get
            {
                return HttpContext.Current.Session["SecurityLevel"] == null ? -1 : Convert.ToInt32(HttpContext.Current.Session["SecurityLevel"].ToString());
            }
        }

        public Security()
        {

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

            HttpContext.Current.Session["UserID"] = int.Parse(dsLogin.Tables[0].Rows[0]["UserID"].ToString());
            HttpContext.Current.Session["FullName"] = dsLogin.Tables[0].Rows[0]["FullName"].ToString();
            HttpContext.Current.Session["SecurityLevel"] =int.Parse(dsLogin.Tables[0].Rows[0]["SecurityLevel"].ToString());

            return true;
        }

        internal bool IsLoggedIn()
        {
            return HttpContext.Current.Session["SecurityLevel"] != null;
        }
        public bool IsClient()
        {
            return IsLoggedIn() && HttpContext.Current.Session["SecurityLevel"].ToString() == "1";
        }
        public bool IsAdmin()
        {
            return IsLoggedIn() && HttpContext.Current.Session["SecurityLevel"].ToString() == "2";
        }

        internal static void LogOut()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
        }

    }
}