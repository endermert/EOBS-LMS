using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;

namespace EOBS_001
{
    public partial class HEP_VeriGiris : System.Web.UI.Page
    {
        public int OZL_ID = 0;

        public int SUB_ID = 0;
        public short GRP_ID = 0;

        public int KUL_ID = 0;
        public string[] SUB_ADS;
        public List<List<HEPTABLO>> GrupList = new List<List<HEPTABLO>>();
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
                    GRP_ID = short.Parse(Request.QueryString["ref2"]);
                    EOBSEntities entity = new EOBSEntities();
                    var kullar = entity.KULLANICILAR.Where(x => x.SUB_ID == SUB_ID);
                    var hep = entity.HEPTABLO.Where(x => x.HEP_GRUP == GRP_ID && x.KULLANICILAR.SUB_ID == SUB_ID);
                    Boolean bul = false;
                    foreach (var kul in kullar)
                    {
                        bul = false;
                        foreach (var dn in hep)
                        {
                            if (kul.KUL_ID == dn.KUL_ID)
                            {
                                bul = true;
                                break;
                            }
                        }
                        if (bul == false)
                        {
                            HEPTABLO HepYeni = new HEPTABLO();
                            HepYeni.KUL_ID = kul.KUL_ID;
                            HepYeni.HEP_GRUP = GRP_ID;
                            HepYeni.OKL_ID = kul.OKL_ID;
                            entity.HEPTABLO.Add(HepYeni);
                        }
                    }
                    entity.SaveChanges();
                    hep = entity.HEPTABLO.Where(x => x.HEP_GRUP == GRP_ID && x.KULLANICILAR.SUB_ID == SUB_ID);
                    List<HEPTABLO> liste = new List<HEPTABLO>();
                    foreach (var dn in hep)
                    {
                        liste.Add(dn);
                    }
                    KayitSay = liste.Count;
                    GrupList.Add(liste);

                    hid_syc.Value = KayitSay.ToString();

                }
                catch
                {
                    Response.Redirect("HEP_VeriGiris.aspx");
                }

            }
            else
            {
                Panel1.Visible = false;
                btnKayit.Visible = false;
            }
        }

        protected void btnListe_Click(object sender, EventArgs e)
        {
            Response.Redirect("HEP_VeriGiris.aspx?ref1=" + RC_Sube.SelectedValue + "&ref2=" + RC_Ders.SelectedValue);
        }

        protected void btnKayit_Click(object sender, EventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            txt_baba.Text = txt_baba.Text.Replace('.', ',');
            String[] Satir;
            Satir= txt_baba.Text.Split('|');
            int HEP_ID;
            for (int i = 0; i < GrupList[0].Count; i++)
            {
                String[] Sutun=Satir[i].Split('!');
                HEP_ID = GrupList[0][i].HEP_ID;
                HEPTABLO Hep = entity.HEPTABLO.First(x=> x.HEP_ID==HEP_ID);

                Hep.HEP_H1 = null;
                Hep.HEP_H2 = null;
                Hep.HEP_H3 = null;
                Hep.HEP_H4 = null;
                //Hep.HEP_H5 = null;
                //Hep.HEP_H6 = null;
                //Hep.HEP_H7 = null;
                //Hep.HEP_H8 = null;
                Hep.HEP_G1 = null;
                Hep.HEP_G2 = null;
                Hep.HEP_G3 = null;
                Hep.HEP_G4 = null;
                //Hep.HEP_G5 = null;
                //Hep.HEP_G6 = null;
                //Hep.HEP_G7 = null;
                //Hep.HEP_G8 = null;

                if (Sutun[0].Trim()!="")
                    Hep.HEP_H1 = short.Parse(Sutun[0]);
                if (Sutun[1].Trim() != "")
                    Hep.HEP_G1 = short.Parse(Sutun[1]);
                if (Sutun[2].Trim() != "")
                    Hep.HEP_H2 = short.Parse(Sutun[2]);
                if (Sutun[3].Trim() != "")
                    Hep.HEP_G2 = short.Parse(Sutun[3]);
                if (Sutun[4].Trim() != "")
                    Hep.HEP_H3 = short.Parse(Sutun[4]);
                if (Sutun[5].Trim() != "")
                    Hep.HEP_G3 = short.Parse(Sutun[5]);
                if (Sutun[6].Trim() != "")
                    Hep.HEP_H4 = short.Parse(Sutun[6]);
                if (Sutun[7].Trim() != "")
                    Hep.HEP_G4 = short.Parse(Sutun[7]);
                //if (Sutun[8].Trim() != "")
                //    Hep.HEP_H5 = short.Parse(Sutun[8]);
                //if (Sutun[9].Trim() != "")
                //    Hep.HEP_G5 = short.Parse(Sutun[9]);
                //if (Sutun[10].Trim() != "")
                //    Hep.HEP_H6 = short.Parse(Sutun[10]);
                //if (Sutun[11].Trim() != "")
                //    Hep.HEP_G6 = short.Parse(Sutun[11]);
                //if (Sutun[12].Trim() != "")
                //    Hep.HEP_H7 = short.Parse(Sutun[12]);
                //if (Sutun[13].Trim() != "")
                //    Hep.HEP_G7 = short.Parse(Sutun[13]);
                //if (Sutun[14].Trim() != "")
                //    Hep.HEP_H8 = short.Parse(Sutun[14]);
                //if (Sutun[15].Trim() != "")
                //    Hep.HEP_G8 = short.Parse(Sutun[15]);
                
                GrupList[0][i] = Hep;
            }
            entity.SaveChanges();

        }

        protected void RC_Sinif_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            RC_Sube.SelectedIndex = -1;
            RC_Sube.Text = "Seçiniz..";
        }
    }
}