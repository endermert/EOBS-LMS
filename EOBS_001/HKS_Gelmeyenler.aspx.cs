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
    public partial class HKS_Gelmeyenler : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            txt_Tar.Text = DateTime.Now.ToString();
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
            if (cb_Kul.CheckedItems.Count > 0)
            {
                EOBSEntities entity = new EOBSEntities();
                for (int i = 0; i < cb_Kul.CheckedItems.Count; i++)
                {
                    DEVAMSIZ dvm = new DEVAMSIZ();
                    if (cb_Gun.SelectedIndex != -1)
                    {
                        dvm.DVM_AD = cb_Gun.Text;
                        if (cb_Gun.SelectedIndex == 0)
                            dvm.DVM_GUN = 1;
                        if (cb_Gun.SelectedIndex == 1)
                            dvm.DVM_GUN = (decimal)0.5;
                        if (cb_Gun.SelectedIndex == 2)
                            dvm.DVM_GUN = (decimal)0.5;
                    }
                    dvm.HFT_ID = int.Parse(Session["AktifHaftaId"].ToString());
                    dvm.OKL_ID = int.Parse(Session["AktifOkulId"].ToString());
                    dvm.KUL_ID = int.Parse(cb_Kul.CheckedItems[i].Value);
                    dvm.DVM_TAR = DateTime.Parse(txt_Tar.Text);

                    if (cb_Mazeret.SelectedIndex == 3 || cb_Mazeret.SelectedIndex == -1)
                        dvm.DVM_MAZERET = txtMazeret.Text;
                    else
                        dvm.DVM_MAZERET = cb_Mazeret.Text;
                    
                    entity.DEVAMSIZ.Add(dvm);
                }
            
                entity.SaveChanges();
            }
        }


    }
}