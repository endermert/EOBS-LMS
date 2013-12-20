using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class KRN_NotGiris : System.Web.UI.Page
    {
        public int OZL_ID = 0;

        public int SUB_ID = 0;
        public int DRS_ID = 0;

        public int KUL_ID = 0;
        public string[] SUB_ADS;
        public List<List<KARNEDERSNOT>> GrupList = new List<List<KARNEDERSNOT>>();
        public int KayitSay = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KulId"] != null)
                KUL_ID = int.Parse(Session["KulId"].ToString());
            
            if (Request.QueryString["ref1"] != null && Request.QueryString["ref2"] != null)
            {
                try
                {
                    SUB_ID = int.Parse(Request.QueryString["ref1"]);
                    DRS_ID = int.Parse(Request.QueryString["ref2"]);
                    EOBSEntities entity = new EOBSEntities();
                    var kullar = entity.KULLANICILAR.Where(x => x.SUB_ID == SUB_ID);
                    var kdn = entity.KARNEDERSNOT.Where(x => x.DRS_ID == DRS_ID && x.KULLANICILAR.SUB_ID == SUB_ID);
                    Boolean bul = false;
                    foreach (var kul in kullar)
                    {
                        bul = false;
                        foreach (var dn in kdn)
                        {
                            if (kul.KUL_ID == dn.KUL_ID)
                            {
                                bul = true;
                                break;
                            }
                        }
                        if (bul == false)
                        {
                            KARNEDERSNOT kdnyeni = new KARNEDERSNOT();
                            kdnyeni.KUL_ID = kul.KUL_ID;
                            kdnyeni.DRS_ID = DRS_ID;
                            kdnyeni.KDN_DONEM = 1;
                            entity.KARNEDERSNOT.Add(kdnyeni);
                        }
                    }
                    entity.SaveChanges();
                    kdn = entity.KARNEDERSNOT.Where(x => x.DRS_ID == DRS_ID && x.KULLANICILAR.SUB_ID == SUB_ID);
                    List<KARNEDERSNOT> liste = new List<KARNEDERSNOT>();
                    foreach (var dn in kdn)
                    {
                        liste.Add(dn);
                    }
                    KayitSay = liste.Count;
                    GrupList.Add(liste);

                    hid_syc.Value = KayitSay.ToString();
                    
                }
                catch
                {
                    Response.Redirect("KRN_NotGiris.aspx");
                }

            }
            else
            {
                Panel1.Visible = false;
                btnKayit.Visible = false;
            }
            
        }

        protected void RC_Sube_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void RC_Sinif_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            RC_Sube.SelectedIndex = -1;
            RC_Ders.SelectedIndex = -1;
            RC_Ders.Text = "Seçiniz..";
            RC_Sube.Text = "Seçiniz..";
            
        }

        protected void btnListe_Click(object sender, EventArgs e)
        {
            Response.Redirect("KRN_NotGiris.aspx?ref1="+RC_Sube.SelectedValue+"&ref2="+RC_Ders.SelectedValue);
        }

        protected void btnKayit_Click(object sender, EventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            txt_baba.Text = txt_baba.Text.Replace('.', ',');
            String[] Satir;
            Satir= txt_baba.Text.Split('|');
            int KDN_ID;
            for (int i = 0; i < GrupList[0].Count; i++)
            {
                String[] Sutun=Satir[i].Split('!');
                KDN_ID = GrupList[0][i].KDN_ID;
                KARNEDERSNOT kdn = entity.KARNEDERSNOT.First(x => x.KDN_ID == KDN_ID);

                kdn.KDN_S1 = null;
                kdn.KDN_S2 = null;
                kdn.KDN_S3 = null;
                kdn.KDN_S4 = null;
                kdn.KDN_PRO1 = null;
                kdn.KDN_PRO2 = null;
                kdn.KDN_PROORT = null;
                kdn.KDN_PEK1 = null;
                kdn.KDN_PEK2 = null;
                kdn.KDN_PEK3 = null;
                kdn.KDN_PEKORT = null;
                kdn.KDN_PG1 = null;
                kdn.KDN_PG2 = null;
                kdn.KDN_PG3 = null;
                kdn.KDN_PG4 = null;
                kdn.KDN_PG5 = null;
                kdn.KDN_PGORT = null;
                kdn.KDN_PERORT = null;
                kdn.KDN_NOT = null;
                kdn.KDN_PUAN = null;

                if (Sutun[0].Trim()!="")
                kdn.KDN_S1 = short.Parse(Sutun[0]);
                if (Sutun[1].Trim() != "")
                kdn.KDN_S2 = short.Parse(Sutun[1]);
                if (Sutun[2].Trim() != "")
                kdn.KDN_S3 = short.Parse(Sutun[2]);
                if (Sutun[3].Trim() != "")
                kdn.KDN_S4 = short.Parse(Sutun[3]);
                if (Sutun[4].Trim() != "")
                kdn.KDN_PRO1 = short.Parse(Sutun[4]);
                if (Sutun[5].Trim() != "")
                kdn.KDN_PRO2 = short.Parse(Sutun[5]);
                if (Sutun[6].Trim() != "")
                kdn.KDN_PROORT = decimal.Parse(Sutun[6]);
                if (Sutun[7].Trim() != "")
                kdn.KDN_PEK1 = short.Parse(Sutun[7]);
                if (Sutun[8].Trim() != "")
                kdn.KDN_PEK2 = short.Parse(Sutun[8]);
                if (Sutun[9].Trim() != "")
                kdn.KDN_PEK3 = short.Parse(Sutun[9]);
                if (Sutun[10].Trim() != "")
                kdn.KDN_PEKORT = decimal.Parse(Sutun[10]);
                if (Sutun[11].Trim() != "")
                kdn.KDN_PG1 = short.Parse(Sutun[11]);
                if (Sutun[12].Trim() != "")
                kdn.KDN_PG2 = short.Parse(Sutun[12]);
                if (Sutun[13].Trim() != "")
                kdn.KDN_PG3 = short.Parse(Sutun[13]);
                if (Sutun[14].Trim() != "")
                kdn.KDN_PG4 = short.Parse(Sutun[14]);
                if (Sutun[15].Trim() != "")
                kdn.KDN_PG5 = short.Parse(Sutun[15]);
                if (Sutun[16].Trim() != "")
                kdn.KDN_PGORT = decimal.Parse(Sutun[16]);
                if (Sutun[17].Trim() != "")
                kdn.KDN_PERORT = decimal.Parse(Sutun[17]);
                if (Sutun[18].Trim() != "")
                kdn.KDN_NOT = short.Parse(Sutun[18]);
                if (Sutun[19].Trim() != "")
                kdn.KDN_PUAN = decimal.Parse(Sutun[19]);
                
                GrupList[0][i] = kdn;
            }
            entity.SaveChanges();

        }
    }
}