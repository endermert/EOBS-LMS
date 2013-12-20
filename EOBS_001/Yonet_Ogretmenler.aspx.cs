using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBS_001.Kontrol;
using EOBSModel;

namespace EOBS_001
{
    public partial class Yonet_OgretmenTanim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (EDS_Ogretmenler.InsertParameters.Count == 0)
                {
                    EDS_Ogretmenler.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Ogretmenler.InsertParameters.Add("YTK_ID", System.Data.DbType.Int16,"2");
                }
            }
            catch
            { 

            }
        }

        protected void EDS_Ogretmenler_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            KULLANICILAR KUL = new KULLANICILAR();
            KUL = (KULLANICILAR)e.Entity;

            EOBSEntities entity = new EOBSEntities();
            var okullar = entity.OKULLAR.Where(x => true);


            if (KUL.KUL_TEMP != null)
            {
                String[] OKL_ADS = (KUL.KUL_TEMP).Split(',');
                for (int j = 0; j < OKL_ADS.Length; j++)
                {
                    foreach (var item in okullar)
                    {
                        if (item.OKL_ADI.TrimStart() == OKL_ADS[j].TrimStart())
                        {
                            SDS_Ara.InsertParameters["OKL_ID"].DefaultValue = item.OKL_ID.ToString();
                            SDS_Ara.InsertParameters["KUL_ID"].DefaultValue = KUL.KUL_ID.ToString();
                            SDS_Ara.Insert();
                        }

                    }


                }
            }
            
        }

        protected void EDS_Ogretmenler_Updated(object sender, EntityDataSourceChangedEventArgs e)
        {

            KULLANICILAR KUL = new KULLANICILAR();
            KUL = (KULLANICILAR)e.Entity;

            EOBSEntities entity = new EOBSEntities();
            var okullar = entity.OKULLAR.Where(x => true);

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL2 WHERE KUL_ID=" + KUL.KUL_ID.ToString();
            SDS_Ara.Delete();

            if (KUL.KUL_TEMP != null)
            {
                String[] OKL_ADS = (KUL.KUL_TEMP).Split(',');
                for (int j = 0; j < OKL_ADS.Length; j++)
                {
                    foreach (var item in okullar)
                    {
                        if (item.OKL_ADI.TrimStart() == OKL_ADS[j].TrimStart())
                        {
                            SDS_Ara.InsertParameters["OKL_ID"].DefaultValue = item.OKL_ID.ToString();
                            SDS_Ara.InsertParameters["KUL_ID"].DefaultValue = KUL.KUL_ID.ToString();
                            SDS_Ara.Insert();
                        }

                    }


                }
            }
        }

        protected void EDS_Ogretmenler_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            KULLANICILAR KUL = new KULLANICILAR();
            KUL = (KULLANICILAR)e.Entity;

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL2 WHERE KUL_ID=" + KUL.KUL_ID;
            SDS_Ara.Delete();
        }

        protected void EDS_Ogretmenler_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            KULLANICILAR kul = (KULLANICILAR)e.Entity;
            if (kul != null)
            {
                if (kul.KUL_AD == null)
                    e.Cancel = true;
                else
                    kul.KUL_AD = Fonk.TrKrktrYokEt(kul.KUL_AD.ToUpper(), true);

                if (kul.KUL_SIFRE == null)
                    e.Cancel = true;

                if (kul.KUL_ISIM == null)
                    e.Cancel = true;
                else
                    kul.KUL_ISIM = kul.KUL_ISIM.ToUpper();

                if (kul.KUL_SOYISIM == null)
                    e.Cancel = true;
                else
                    kul.KUL_SOYISIM = kul.KUL_SOYISIM.ToUpper();
            }
        }

        protected void EDS_Ogretmenler_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            KULLANICILAR kul = (KULLANICILAR)e.Entity;
            if (kul != null)
            {
                if (kul.KUL_AD == null)
                    e.Cancel = true;
                else
                    kul.KUL_AD = Fonk.TrKrktrYokEt(kul.KUL_AD.ToUpper(), true);

                if (kul.KUL_SIFRE == null)
                    e.Cancel = true;

                if (kul.KUL_ISIM == null)
                    e.Cancel = true;
                else
                    kul.KUL_ISIM = kul.KUL_ISIM.ToUpper();

                if (kul.KUL_SOYISIM == null)
                    e.Cancel = true;
                else
                    kul.KUL_SOYISIM = kul.KUL_SOYISIM.ToUpper();
            }
        }

        
    }
}