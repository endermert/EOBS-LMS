using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    
    public partial class ODS_SinavDetay : System.Web.UI.Page
    {        
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
        }

        protected void GridDamla_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridDamla.SelectedValue != null)
                Response.Redirect("ODS_OptikFormlar.aspx?ref="+GridDamla.SelectedValue.ToString());
        }

        protected void EDS_SinavDetay_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            EOBSEntities entity=new EOBSEntities();
            SINAVDETAY sdt = (SINAVDETAY)e.Entity;
            if (sdt.SDT_AD != null)
                sdt.SDT_AD = sdt.SDT_AD.ToUpper();
            int id=0;
            try { id = entity.SINAVTIP.First(x=> x.STP_AD=="YGS").STP_ID;} 
            catch{}
            if (sdt.STP_ID == id)
            {
                try { id = entity.DERSLER.First(x => x.DRS_AD == "TÜRKÇE").DRS_ID; }
                catch { }
                sdt.SDT_DRS0 = id;
                sdt.SDT_DRS0SS = 40;
                sdt.SDT_DRS0KS = 2;
                try { id = entity.DERSLER.First(x => x.DRS_AD == "MATEMATİK").DRS_ID; }
                catch { }
                sdt.SDT_DRS1 = id;
                sdt.SDT_DRS1SS = 28;
                sdt.SDT_DRS1KS = 4;
                try { id = entity.DERSLER.First(x => x.DRS_AD == "GEOMETRİ").DRS_ID; }
                catch { }
                sdt.SDT_DRS2 = id;
                sdt.SDT_DRS2SS = 12;
                sdt.SDT_DRS2KS = 4;
                try { id = entity.DERSLER.First(x => x.DRS_AD == "TARİH").DRS_ID; }
                catch { }
                sdt.SDT_DRS3 = id;
                sdt.SDT_DRS3SS = 17;
                sdt.SDT_DRS3KS = 1;
                try { id = entity.DERSLER.First(x => x.DRS_AD == "COĞRAFYA").DRS_ID; }
                catch { }
                sdt.SDT_DRS4 = id;
                sdt.SDT_DRS4SS = 13;
                sdt.SDT_DRS4KS = 1;
                try { id = entity.DERSLER.First(x => x.DRS_AD == "FELSEFE").DRS_ID; }
                catch { }
                sdt.SDT_DRS5 = id;
                sdt.SDT_DRS5SS = 10;
                sdt.SDT_DRS5KS = 1;
                try { id = entity.DERSLER.First(x => x.DRS_AD == "FİZİK").DRS_ID; }
                catch { }
                sdt.SDT_DRS6 = id;
                sdt.SDT_DRS6SS = 14;
                sdt.SDT_DRS6KS = 3;
                try { id = entity.DERSLER.First(x => x.DRS_AD == "KİMYA").DRS_ID; }
                catch { }
                sdt.SDT_DRS7 = id;
                sdt.SDT_DRS7SS = 13;
                sdt.SDT_DRS7KS = 3;
                try { id = entity.DERSLER.First(x => x.DRS_AD == "BİYOLOJİ").DRS_ID; }
                catch { }
                sdt.SDT_DRS8 = id;
                sdt.SDT_DRS8SS = 13;
                sdt.SDT_DRS8KS = 3;

                sdt.SDT_DERSLER = "TÜRKÇE, TEMEL MATEMATİK, SOSYAL, FEN";
                sdt.SDT_TOPSORU = 160;
                sdt.SDT_TABPUAN = 100;
                sdt.SDT_NOT = "Otomatik Eklenmiştir.";
            }

        }


        protected void EDS_SinavDetay_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            SINAVDETAY sdt = (SINAVDETAY)e.Entity;
            if (sdt.SDT_AD != null)
                sdt.SDT_AD = sdt.SDT_AD.ToUpper();
        }
    }
}