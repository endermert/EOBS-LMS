using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class HKS_OdevSnclar1 : System.Web.UI.Page
    {
        private int OKL_ID = 0;
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
            if (Session["AktifOkulId"] != null)
            {
                OKL_ID = int.Parse(Session["AktifOkulId"].ToString());
            }
            if (Session["KulYetki"] != null)
            {
                if (Session["KulYetki"].ToString() == "111") //yönetici
                {
                    EDS_OdevSnclar.WhereParameters.Clear();
                    EDS_OdevSnclar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_OdevSnclar.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                }
                else
                {
                    EDS_OdevSnclar.WhereParameters.Clear();
                    EDS_OdevSnclar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_OdevSnclar.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                    EDS_OdevSnclar.WhereParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
                }
            }

            try
            {
                EDS_OdevSnclar.InsertParameters.Clear();
                EDS_OdevSnclar.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                EDS_OdevSnclar.InsertParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                EDS_OdevSnclar.InsertParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());

            }
            catch
            {

            }
        }

        protected void GridDamla_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridDamla.SelectedValue != null)
                Response.Redirect("HKS_OdevSnc.aspx?onref=" + GridDamla.SelectedValue.ToString());
        }

        

        protected void EDS_OdevSnclar_Updated(object sender, EntityDataSourceChangedEventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            ODEVSNCLAR odevsnclar = new ODEVSNCLAR();
            odevsnclar = (ODEVSNCLAR)e.Entity;
            int id = odevsnclar.SNC_ID;
            var list = entity.ODEVSNC.Where(x => x.SNC_ID == id);
            foreach (var item in list)
                entity.ODEVSNC.Remove(item);
            if (odevsnclar.SUB_ADS != null)
            {
                String[] SUB_ADS = odevsnclar.SUB_ADS.Split(',');

                for (int i = 0; i < SUB_ADS.Length; i++)
                {
                    string temp = SUB_ADS[i].Trim();
                    SUBELER sube = new SUBELER();
                    sube = entity.SUBELER.First(x => x.SUB_AD == temp && x.OKL_ID == OKL_ID);
                    foreach (var item in sube.KULLANICILAR)
                    {
                        ODEVSNC odevsnc = new ODEVSNC();
                        odevsnc.KUL_ID = item.KUL_ID;
                        odevsnc.ODE_GRUP = temp;
                        odevsnc.SNC_ID = odevsnclar.SNC_ID;
                        odevsnc.HFT_ID = int.Parse(Session["AktifHaftaId"].ToString());
                        odevsnc.ODE_DURUM1 = true;
                        odevsnc.ODE_SNC = "SONUŞSUZ";
                        entity.ODEVSNC.Add(odevsnc);
                    }

                }
            }
            entity.SaveChanges();
        }

        protected void EDS_OdevSnclar_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            ODEVSNCLAR odevsnclar = new ODEVSNCLAR();
            odevsnclar = (ODEVSNCLAR)e.Entity;
            int temp = odevsnclar.SNC_ID;
            var list = entity.ODEVSNC.Where(x => x.SNC_ID == temp);
            foreach (var item in list)
                entity.ODEVSNC.Remove(item);
            entity.SaveChanges();
        }

        protected void EDS_OdevSnclar_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            ODEVSNCLAR odevsnclar = new ODEVSNCLAR();
            odevsnclar = (ODEVSNCLAR)e.Entity;
            if (odevsnclar.SUB_ADS != null)
            {
                String[] SUB_ADS = odevsnclar.SUB_ADS.Split(',');
                for (int i = 0; i < SUB_ADS.Length; i++)
                {
                    string temp = SUB_ADS[i].Trim();
                    SUBELER sube = new SUBELER();
                    sube = entity.SUBELER.First(x => x.SUB_AD == temp && x.OKL_ID == OKL_ID);
                    foreach (var item in sube.KULLANICILAR)
                    {
                        ODEVSNC odevsnc = new ODEVSNC();
                        odevsnc.KUL_ID = item.KUL_ID;
                        odevsnc.ODE_GRUP = temp;
                        odevsnc.SNC_ID = odevsnclar.SNC_ID;
                        odevsnc.HFT_ID = odevsnclar.HFT_ID;
                        odevsnc.ODE_DURUM1 = true;
                        entity.ODEVSNC.Add(odevsnc);


                    }

                }
            }

            entity.SaveChanges();
        }

        protected void EDS_OdevSnclar_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            ODEVSNCLAR odevsnclar = (ODEVSNCLAR)e.Entity;
            if (odevsnclar.SNC_AD != null)
                odevsnclar.SNC_AD = odevsnclar.SNC_AD.ToUpper();
            
        }
    }
}