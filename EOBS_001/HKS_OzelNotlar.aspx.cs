using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;

namespace EOBS_001
{
    public partial class HKS_OzelNotlar1 : System.Web.UI.Page
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
                    EDS_OzelNotlar.WhereParameters.Clear();
                    EDS_OzelNotlar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_OzelNotlar.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                }
                else
                {
                    EDS_OzelNotlar.WhereParameters.Clear();
                    EDS_OzelNotlar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_OzelNotlar.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                    EDS_OzelNotlar.WhereParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
                }
            }

            try
            {
                EDS_OzelNotlar.InsertParameters.Clear();
                EDS_OzelNotlar.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                EDS_OzelNotlar.InsertParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                EDS_OzelNotlar.InsertParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());

            }
            catch
            {

            }
        }


        protected void GridDamla_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridDamla.SelectedValue!=null)
                Response.Redirect("HKS_OzelNot.aspx?onref="+GridDamla.SelectedValue.ToString());
            
        }

        protected void EDS_OzelNotlar_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
          
            
            EOBSEntities entity = new EOBSEntities();
            OZELNOTLAR ozelnotlar = new OZELNOTLAR();
            ozelnotlar = (OZELNOTLAR)e.Entity;
            if (ozelnotlar.SUB_ADS != null)
            {
                String[] SUB_ADS = ozelnotlar.SUB_ADS.Split(',');
                for (int i = 0; i < SUB_ADS.Length; i++)
                {
                    string temp = SUB_ADS[i].Trim();
                    SUBELER sube = new SUBELER();
                    sube = entity.SUBELER.First(x => x.SUB_AD == temp && x.OKL_ID == OKL_ID);
                    foreach (var item in sube.KULLANICILAR)
                    {
                        OZELNOT ozelnot = new OZELNOT();
                        ozelnot.KUL_ID = item.KUL_ID;
                        ozelnot.OZN_GRUP = temp;
                        ozelnot.OZL_ID = ozelnotlar.OZL_ID;
                        ozelnot.HFT_ID = ozelnotlar.HFT_ID;
                        entity.OZELNOT.Add(ozelnot);


                    }

                }
            }
            entity.SaveChanges();
            
        }

        protected void EDS_OzelNotlar_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            OZELNOTLAR ozelnotlar = new OZELNOTLAR();
            ozelnotlar = (OZELNOTLAR)e.Entity;
            int temp = ozelnotlar.OZL_ID;
            var list = entity.OZELNOT.Where(x=> x.OZL_ID==temp);
            foreach (var item in list)
                entity.OZELNOT.Remove(item);
            entity.SaveChanges();
        }

        protected void EDS_OzelNotlar_Updated(object sender, EntityDataSourceChangedEventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            OZELNOTLAR ozelnotlar = new OZELNOTLAR();
            ozelnotlar = (OZELNOTLAR)e.Entity;
            int id = ozelnotlar.OZL_ID;
            var list = entity.OZELNOT.Where(x => x.OZL_ID == id);
            foreach (var item in list)
                entity.OZELNOT.Remove(item);

            if (ozelnotlar.SUB_ADS != null)
            {
                String[] SUB_ADS = ozelnotlar.SUB_ADS.Split(',');
                for (int i = 0; i < SUB_ADS.Length; i++)
                {
                    string temp = SUB_ADS[i].Trim();
                    SUBELER sube = new SUBELER();
                    sube = entity.SUBELER.First(x => x.SUB_AD == temp && x.OKL_ID == OKL_ID);
                    foreach (var item in sube.KULLANICILAR)
                    {
                        OZELNOT ozelnot = new OZELNOT();
                        ozelnot.KUL_ID = item.KUL_ID;
                        ozelnot.OZN_GRUP = temp;
                        ozelnot.OZL_ID = ozelnotlar.OZL_ID;
                        ozelnot.HFT_ID = int.Parse(Session["AktifHaftaId"].ToString());
                        entity.OZELNOT.Add(ozelnot);


                    }

                }
            }

            entity.SaveChanges();
        }

        protected void EDS_OzelNotlar_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            OZELNOTLAR ozelnotlar = (OZELNOTLAR)e.Entity;
            if (ozelnotlar.OZL_AD != null)
                ozelnotlar.OZL_AD = ozelnotlar.OZL_AD.ToUpper();
        }
    }
}