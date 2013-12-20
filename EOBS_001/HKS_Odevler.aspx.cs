using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;

namespace EOBS_001
{
    public partial class HKS_Odevler : System.Web.UI.Page
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
                    EDS_Odevler.WhereParameters.Clear();
                    EDS_Odevler.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Odevler.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                }
                else
                {
                    EDS_Odevler.WhereParameters.Clear();
                    EDS_Odevler.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Odevler.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                    EDS_Odevler.WhereParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
                }
            }

            try
            {

                EDS_Odevler.InsertParameters.Clear();
                EDS_Odevler.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                EDS_Odevler.InsertParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                EDS_Odevler.InsertParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());

            }
            catch
            {

            }
        }

    
        protected void EDS_Odevler_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            ODEVLER ODV=new ODEVLER();
            ODV = (ODEVLER)e.Entity;
            int i = ODV.ODV_ID;

            EOBSEntities entity = new EOBSEntities();
            var subeler = entity.SUBELER.Where(x => x.OKL_ID == ODV.OKL_ID);

            if (ODV.SUB_ADS != null)
            {

                String[] SUB_ADS= (ODV.SUB_ADS).Split(',');
                for (int j = 0; j < SUB_ADS.Length; j++)
                {
                    foreach (var item in subeler)
                    {
                        if (item.SUB_AD.Trim() == SUB_ADS[j].Trim())
                        {
                            SDS_Ara.InsertParameters["ODV_ID"].DefaultValue = ODV.ODV_ID.ToString();
                            SDS_Ara.InsertParameters["SUB_ID"].DefaultValue = item.SUB_ID.ToString();
                            SDS_Ara.InsertParameters["HFT_ID"].DefaultValue = ODV.HFT_ID.ToString();
                            SDS_Ara.Insert();
                        }

                    }
                    

                }
            }
            
        }

        protected void EDS_Odevler_Updated(object sender, EntityDataSourceChangedEventArgs e)
        {
            ODEVLER ODV = new ODEVLER();
            ODV = (ODEVLER)e.Entity;
            int i = ODV.ODV_ID;

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL1 WHERE ODV_ID=" + ODV.ODV_ID;
            SDS_Ara.Delete();

            EOBSEntities entity = new EOBSEntities();
            if (ODV.OKL_ID == null || Session["AktifOkulId"] != null)
                ODV.OKL_ID = int.Parse(Session["AktifOkulId"].ToString());

            var subeler = entity.SUBELER.Where(x => x.OKL_ID == ODV.OKL_ID);

            if (ODV.SUB_ADS != null)
            {

                String[] SUB_ADS = (ODV.SUB_ADS).Split(',');
                for (int j = 0; j < SUB_ADS.Length; j++)
                {
                    foreach (var item in subeler)
                    {
                        if (item.SUB_AD.Trim() == SUB_ADS[j].Trim())
                        {
                            SDS_Ara.InsertParameters["ODV_ID"].DefaultValue = ODV.ODV_ID.ToString();
                            SDS_Ara.InsertParameters["SUB_ID"].DefaultValue = item.SUB_ID.ToString();
                            SDS_Ara.InsertParameters["HFT_ID"].DefaultValue = ODV.HFT_ID.ToString();
                            SDS_Ara.Insert();
                        }

                    }


                }
            }
            
        }

        protected void EDS_Odevler_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            ODEVLER ODV = new ODEVLER();
            ODV = (ODEVLER)e.Entity;
            int i = ODV.ODV_ID;

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL1 WHERE ODV_ID=" + ODV.ODV_ID;
            SDS_Ara.Delete();


        }

        protected void EDS_Odevler_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            ODEVLER ODV = (ODEVLER)e.Entity;

            if (ODV.ODV_AD != null)
                ODV.ODV_AD = ODV.ODV_AD.ToUpper();

            ODV.ODV_TAR = DateTime.Now;
        }
    }
}