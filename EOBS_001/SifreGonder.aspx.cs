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
    public partial class SifreGonder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnGiris.Visible = false;
            if (Session["Temp"] != null)
            {
                if (Session["Temp"] == "1")
                {
                    lblMsg.Text = "SMS Gönderildi.";
                    btnGiris.Visible = true;
                }
                if (Session["Temp"] == "0")
                    lblMsg.Text = "SMS Gönderilemedi.";
                if (Session["Temp"] == "2")
                    lblMsg.Text = "Hatalı TC Kimlik No.";

                Session.Remove("Temp");
            }
            

            
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            try
            {
                KULLANICILAR Kul = entity.KULLANICILAR.First(x => x.KUL_TCNO == txtTCKimlik.Text.Trim());
                Sms sms = new Sms();
                //if (sms.Gonder((int)Kul.OKL_ID, Kul.KUL_TEL1, "Bir onceki mesajı lutfen dikkate almayınız. Test Mesajıdır. İyi Günler."))
                if (sms.Gonder((int)Kul.OKL_ID, Kul.KUL_TEL1, "Web Erisimi icin, Kullanici Adi: " + Kul.KUL_AD + " Sifre: " + Kul.KUL_SIFRE))
                {
                    Session["Temp"] = "1";
                }
                else
                {
                    Session["Temp"] = "0";
                }

            }
            catch {
                Session["Temp"] = "2";
            }

            Response.Redirect("SifreGonder.aspx");

            
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }
}