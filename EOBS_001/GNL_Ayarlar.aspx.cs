using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class GNL_Ayarlar : System.Web.UI.Page
    {
        KULLANICILAR kul;
        protected void Page_Load(object sender, EventArgs e)
        {
            kul = (KULLANICILAR)Session["Kul"];
            lTcKimlik.Text = kul.KUL_TCNO;
            lNO.Text = kul.KUL_NO.ToString();
            lAd.Text = kul.KUL_ISIM;
            lSoyad.Text = kul.KUL_SOYISIM;
            if (kul.SUBELER!=null)
            lSinif.Text = kul.SUBELER.SUB_AD;
            lVeli.Text = kul.KUL_VISIM;
            lGsm1.Text = kul.KUL_TEL1;
            lGsm2.Text = kul.KUL_TEL2;

            lTcKimliko.Text = kul.KUL_TCNO;
            lAdo.Text = kul.KUL_ISIM;
            lSoyado.Text = kul.KUL_SOYISIM;
            lGsmo1.Text = kul.KUL_TEL1;
            lGsmo2.Text = kul.KUL_TEL2;
            if (kul.BRANSLAR != null)
                lBrans.Text = kul.BRANSLAR.BRS_AD;

            pOgrenci.Visible = false;
            pOgretmen.Visible = false;

            if (Session["KulYetki"] != null)
            {
                if (Session["KulYetki"].ToString() == "333" || Session["KulYetki"].ToString() == "444")
                {
                    pOgrenci.Visible = true;
                }
                else
                {
                    pOgretmen.Visible=true;
                }
            }
            EOBSEntities entity = new EOBSEntities();
            if (kul.RE1_ID!=null)
            lReh1.Text = entity.SUBELER.First(x => x.SUB_ID == kul.RE1_ID).SUB_AD;
            if (kul.RE2_ID != null)
            lReh2.Text = entity.SUBELER.First(x => x.SUB_ID == kul.RE2_ID).SUB_AD;
            if (kul.RE3_ID != null)
            lReh3.Text = entity.SUBELER.First(x => x.SUB_ID == kul.RE3_ID).SUB_AD;

        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            if (txtMevSifre.Text.Trim() == "" || txtYeniSifre1.Text.Trim() == "" || txtYeniSifre2.Text.Trim() == "")
            {
                msg1.Title = "Dikkat";
                msg1.Text = "Şifre alanlarını boş bırakmayınız.";
                msg1.Show();
                return;
            }

            if (txtMevSifre.Text != kul.KUL_SIFRE)
            {
                msg1.Title = "Dikkat";
                msg1.Text = "Mevcut şifrenizi yanlış girdiniz.";
                msg1.Show();
                return;
            }
            if (txtYeniSifre1.Text != txtYeniSifre2.Text)
            {
                msg1.Title = "Dikkat";
                msg1.Text = "Yeni şifreniz uyumsuz. Lütfen doğru girdiğinizden emin olun.";
                msg1.Show();
                return;
            }

            EOBSEntities entity = new EOBSEntities();
            int KUL_ID = kul.KUL_ID;
            KULLANICILAR edit = entity.KULLANICILAR.First(x=> x.KUL_ID==KUL_ID);
            edit.KUL_SIFRE = txtYeniSifre1.Text;
            entity.SaveChanges();
            
            msg1.Title = "Tamam";
            msg1.Text = "Şifreniz yenisiyle değiştirildi..";
            msg1.Show();
        }

        
    }
}