using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
using EOBS_001.Kontrol;
namespace EOBS_001
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            KULLANICILAR kul = new KULLANICILAR();
            kul = proLogin.Giris(txtKulad.Text, txtSifre.Text);
            if (kul != null)
            {
                Session["kul"] = kul;
                Session["kulAd"] = txtKulad.Text;
                Session["kulSifre"] = txtSifre.Text;
                Session["KulYetki"] = kul.YETKILER.YTK_KODU.ToString();
                //Session["KulBrans"] = kul.BRANSLAR.BRS_AD;
                Session["KulId"] = kul.KUL_ID.ToString();

                if (Session["Sayfalar"] != null)
                {
                    Session.Remove("Sayfalar");
                }

                if (kul.OKULLAR != null)
                { 
                    Session["OkulTur"]=kul.OKULLAR.OTR_KOD.ToString();
                }

                if (kul.YETKILER.YTK_KODU.ToString() == "333" || kul.YETKILER.YTK_KODU.ToString() == "444")
                {
                    Session["AktifOkulId"] = kul.OKL_ID.ToString();
                }


                if (kul.YETKILER.YTK_KODU.ToString() == "333" || kul.YETKILER.YTK_KODU.ToString() == "444")
                {
                    Response.Redirect("index1.aspx");
                }
                else if (kul.YETKILER.YTK_KODU.ToString() == "222")
                {
                    Response.Redirect("index2.aspx");
                }
                else
                {
                    Response.Redirect("index.aspx"); 
                }

                

            }
        }

        protected void btnUnuttum_Click(object sender, EventArgs e)
        {
            Response.Redirect("SifreGonder.aspx");
        }
    }
}