using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace EOBS_001
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError().InnerException;
            if (exc != null)
            {
                string session = "Client IP : " + Request.UserHostAddress + ", Client Name : " + Request.UserHostName + ", ";
                string kullanici = "anonim";

                if (HttpContext.Current.Session != null)
                {
                    for (int i = 0; i < Session.Count; i++)
                    {
                        session += string.Format("{0} : {1} , ", Session.Keys[i], Session[i].ToString());
                    }
                }

                if (Session["KulId"] != null)
                    kullanici = Session["KulId"].ToString();

                //DataSet1TableAdapters.hataraporlariTableAdapter adap = new DataSet1TableAdapters.hataraporlariTableAdapter();
                //int id = Convert.ToInt32(adap.HataEkle(exc.Message, exc.ToString(), Request.Url.ToString(), kullanici, DateTime.Now, exc.Source, session, false, ""));

                //int id = HataRaporla.HataRapor(exc.Message, exc.ToString(), Request.Url.ToString(), kullanici, exc.Source, session);

               // Response.Redirect("~/hata.aspx?hataid=" + id.ToString());
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}