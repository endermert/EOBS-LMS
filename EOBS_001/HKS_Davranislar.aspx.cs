using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class HKS_Davranislar : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            

            
        }
        
        
        protected void cb_Sinif_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Sube.SelectedIndex = -1;
            cb_Sube.Text = "SEÇİNİZ";

            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "SEÇİNİZ";
        }

        protected void cb_Sube_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "SEÇİNİZ";
        }

        protected void btn_RaporlaOgr_Click(object sender, EventArgs e)
        {
            
        }

        protected void bnt_kaydet_Click(object sender, EventArgs e)
        {
            if (cb_Kul.CheckedItems.Count > 0 && cb_Davranis.SelectedIndex!=-1)
            {
                EOBSEntities entity = new EOBSEntities();
                for (int i = 0; i < cb_Kul.CheckedItems.Count; i++)
                {
                    DAVRANIS dav = new DAVRANIS();
                    dav.DAV_AD = cb_Davranis.Text;
                    int DVR_ID= int.Parse(cb_Davranis.SelectedValue);
                    var davnot = entity.DAVRANISLAR.FirstOrDefault(xx => xx.DVR_ID == DVR_ID).DVR_NOT;
                    dav.DAV_NOT = davnot;
                    dav.DAV_KULID = int.Parse(Session["KulId"].ToString());
                    dav.DAV_TAR = DateTime.Now;
                    dav.KUL_ID = int.Parse(cb_Kul.CheckedItems[i].Value);
                    dav.OKL_ID = int.Parse(Session["AktifOkulId"].ToString());
                    dav.HFT_ID = int.Parse(Session["AktifHaftaId"].ToString());
                    entity.DAVRANIS.Add(dav);
                    KULLANICILAR kul = entity.KULLANICILAR.FirstOrDefault(x=>x.KUL_ID==dav.KUL_ID);
                    kul.KUL_DAVNOT = (short)(kul.KUL_DAVNOT + dav.DAV_NOT);
                }
                entity.SaveChanges();
            }
        }


    }
}