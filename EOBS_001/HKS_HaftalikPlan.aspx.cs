using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EOBS_001
{
    public partial class HKS_HaftalikPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["AktifOkulId"] == null)
                    if (Session["KulYetki"] != null)
                        if (Session["KulYetki"].ToString() == "111") //yönetici
                        {
                            if (Request.Path != "/Yonet_Okullar.aspx")
                                Response.Redirect("Yonet_Okullar.aspx");
                        }
                        else
                        {
                            if (Request.Path != "/Sec_Okul.aspx")
                                Response.Redirect("Sec_Okul.aspx");
                        }
            }
            catch
            {

            }

            if (Session["KulYetki"] != null)
            {
                if (Session["KulYetki"].ToString() == "111") //yönetici
                {
                    EDS_Planlar.WhereParameters.Clear();
                    EDS_Planlar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //EDS_Planlar.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                }
                else
                {
                    EDS_Planlar.WhereParameters.Clear();
                    EDS_Planlar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //EDS_Planlar.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                    //EDS_Planlar.WhereParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
                }
            }

            try
            {

                EDS_Planlar.InsertParameters.Clear();
                EDS_Planlar.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                //EDS_Planlar.InsertParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                EDS_Planlar.InsertParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());

            }
            catch
            {

            }
        }
    }
}