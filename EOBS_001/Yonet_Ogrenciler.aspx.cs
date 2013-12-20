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
    public partial class Yonet_Ogrenciler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (EDS_Ogrenciler.InsertParameters.Count == 0)
                {
                    EDS_Ogrenciler.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Ogrenciler.InsertParameters.Add("YTK_ID", System.Data.DbType.Int16,"3");
                }
            }
            catch
            {

            }
        }

        protected void RC_Sube_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {

            if (RC_Sube.SelectedIndex != -1)
            {
                if (EDS_Ogrenciler.WhereParameters.Count>2)
                    EDS_Ogrenciler.WhereParameters.RemoveAt(2);
                EDS_Ogrenciler.WhereParameters.Add("SUB_ID", System.Data.DbType.Int32, RC_Sube.SelectedValue);
                RC_Kur.SelectedIndex = -1;
                RC_Kur.Text = "Seçiniz..";
                GridOgrenci.DataBind();
            }
            //if (RC_Sube.SelectedIndex != -1)
            //{
            //    try
            //    {
            //        EDS_Ogrenciler.WhereParameters["SUB_ID"].DefaultValue = RC_Sube.SelectedValue.ToString();
            //    }
            //    catch
            //    {
            //        EDS_Ogrenciler.WhereParameters.Add("SUB_ID", System.Data.DbType.Int32, RC_Sube.SelectedValue);
            //    }

            //    RC_Kur.SelectedIndex = -1;
            //    GridOgrenci.DataBind();
            //}
        }

        protected void RC_Kur_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (RC_Kur.SelectedIndex != -1)
            {
                if (EDS_Ogrenciler.WhereParameters.Count > 2)
                    EDS_Ogrenciler.WhereParameters.RemoveAt(2);
                EDS_Ogrenciler.WhereParameters.Add("KUR_ID", System.Data.DbType.Int32, RC_Kur.SelectedValue);
                RC_Sube.SelectedIndex = -1;
                RC_Sube.Text = "Seçiniz..";
                GridOgrenci.DataBind();
            }
        }

        protected void EDS_Ogrenciler_Inserting(object sender, EntityDataSourceChangingEventArgs e)
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

        protected void EDS_Ogrenciler_Updating(object sender, EntityDataSourceChangingEventArgs e)
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