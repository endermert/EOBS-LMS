using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class HKS_OdevSnc : System.Web.UI.Page
    {
        public int SNC_ID = 0;
        public int KUL_ID = 0;
        public string[] SUB_ADS;
        public List<List<ODEVSNC>> GrupList = new List<List<ODEVSNC>>();
        public int KayitSay = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KulId"] != null)
                KUL_ID = int.Parse(Session["KulId"].ToString());

            if (Request.QueryString["onref"] != null)
            {
                try
                {
                    SNC_ID = int.Parse(Request.QueryString["onref"]);
                    EOBSEntities entity = new EOBSEntities();
                    ODEVSNCLAR odsnc = new ODEVSNCLAR();
                    if (Session["KulYetki"].ToString() == "111") //yönetici
                    {
                        odsnc = entity.ODEVSNCLAR.First(x => x.SNC_ID == SNC_ID);
                    }
                    else
                    {
                        odsnc = entity.ODEVSNCLAR.First(x => x.SNC_ID == SNC_ID && x.KUL_ID == KUL_ID);
                    }

                    if (odsnc.SUB_ADS != null)
                    {
                        SUB_ADS = odsnc.SUB_ADS.Split(',');


                        for (int i = 0; i < SUB_ADS.Length; i++)
                        {
                            string sb = SUB_ADS[i].Trim();
                            var odevler = entity.ODEVSNC.Where(x => x.SNC_ID == SNC_ID && x.ODE_GRUP == sb);
                            List<ODEVSNC> OdevList = new List<ODEVSNC>();
                            foreach (var item in odevler)
                            {
                                KayitSay++;
                                OdevList.Add(item);
                            }
                            GrupList.Add(OdevList);
                        }
                    }
                    hid_syc.Value = KayitSay.ToString();

                }
                catch
                {
                    Response.Redirect("HKS_OdevSnclar.aspx");
                }

            }
            else
            {
                Response.Redirect("HKS_OdevSnclar.aspx");
            }
        }
        protected void btn_kaydet_Click(object sender, EventArgs e)
        {

            String[] msj = txt_baba.Text.Split('|');
            String[] deg = txt_deg.Text.Split('|');
            EOBSEntities entitiy = new EOBSEntities();
            int i = 0;
            if (msj.Length>=int.Parse(hid_syc.Value))
            for (int j = 0; j < GrupList.Count; j++)
            {
                for (int k = 0; k < GrupList[j].Count; k++)
                {
                    int id = GrupList[j][k].ODE_ID;
                    GrupList[j][k].ODE_NOT = msj[i];
                    ODEVSNC odevsnc = entitiy.ODEVSNC.First(x => x.ODE_ID == id);
                    odevsnc.ODE_NOT = msj[i];
                    if (msj[i].Trim() == "")
                    {
                        GrupList[j][k].ODE_AKTIF = false;
                        odevsnc.ODE_AKTIF = false;
                    }
                    else
                    {
                        GrupList[j][k].ODE_AKTIF = true;
                        odevsnc.ODE_AKTIF = true;
                    }

                    odevsnc.ODE_DURUM1 = false;
                    odevsnc.ODE_DURUM2 = false;
                    odevsnc.ODE_DURUM3 = false;
                    odevsnc.ODE_DURUM4 = false;
                    odevsnc.ODE_DURUM5 = false;
                    if (deg[i].Trim() == "0")
                    {
                        odevsnc.ODE_DURUM1 = true;
                        odevsnc.ODE_SNC = "SONUÇSUZ";
                    }
                    if (deg[i].Trim() == "1")
                    {
                        odevsnc.ODE_DURUM2 = true;
                        odevsnc.ODE_SNC = "YAPMADI";
                    }
                    if (deg[i].Trim() == "2")
                    {
                        odevsnc.ODE_SNC = "GETİRMEDİ";
                        odevsnc.ODE_DURUM3 = true;
                    }
                    if (deg[i].Trim() == "3")
                    {
                        odevsnc.ODE_DURUM4 = true;
                        odevsnc.ODE_SNC = "EKSİK";
                    }
                    if (deg[i].Trim() == "4")
                    {
                        odevsnc.ODE_DURUM5 = true;
                        odevsnc.ODE_SNC = "TAM YAPTI";
                    }

                    GrupList[j][k] = odevsnc;
                    i++;
                    entitiy.SaveChanges();

                }
            }
            msg1.Text = "Kayıt Edildi..";
            msg1.Title = "Mesaj";
            msg1.Show();

        }
    }
}