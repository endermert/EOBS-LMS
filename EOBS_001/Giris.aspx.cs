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
    public partial class Giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            KULLANICILAR kul = new KULLANICILAR();
            kul=proLogin.Giris(txtKulad.Text, txtSifre.Text);
            if (kul != null)
            {
                Session["kul"] = kul;
                Session["kulAd"] = txtKulad.Text;
                Session["kulSifre"] = txtSifre.Text;
                Session["KulYetki"] = kul.YETKILER.YTK_KODU.ToString();
                Session["KulId"] = kul.KUL_ID.ToString();
                Response.Redirect("index.aspx");
            }
            
        }

    }
}