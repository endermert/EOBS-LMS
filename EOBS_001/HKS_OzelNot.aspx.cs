using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using EOBSModel;
namespace EOBS_001
{
    public partial class HKS_OzelNot : System.Web.UI.Page
    {
        public int OZL_ID = 0;
        public int KUL_ID = 0;
        public string[] SUB_ADS;
        public List<List<OZELNOT>> GrupList = new List<List<OZELNOT>>();
        public int KayitSay = 0;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["KulId"]!=null)
                KUL_ID=int.Parse(Session["KulId"].ToString());

            if (Request.QueryString["onref"] != null)
            {
                try
                {
                    OZL_ID = int.Parse(Request.QueryString["onref"]);
                    EOBSEntities entity = new EOBSEntities();
                    OZELNOTLAR eOzelNotlar=new OZELNOTLAR();
                    if (Session["KulYetki"].ToString() == "111") //yönetici
                    {
                        eOzelNotlar = entity.OZELNOTLAR.First(x => x.OZL_ID == OZL_ID);
                    }
                    else
                    {
                        eOzelNotlar = entity.OZELNOTLAR.First(x => x.OZL_ID == OZL_ID && x.KUL_ID == KUL_ID);
                    }

                    if (eOzelNotlar.SUB_ADS != null)
                    {
                        SUB_ADS = eOzelNotlar.SUB_ADS.Split(',');


                        for (int i = 0; i < SUB_ADS.Length; i++)
                        {
                            string sb = SUB_ADS[i].Trim();
                            var ozel = entity.OZELNOT.Where(x => x.OZL_ID == OZL_ID && x.OZN_GRUP == sb);
                            //var ozel = entity.OZELNOT.Where(x => x.OZL_ID == OZL_ID);
                            List<OZELNOT> NotList = new List<OZELNOT>();
                            foreach (var item in ozel)
                            {
                                KayitSay++;
                                NotList.Add(item);
                            }
                            GrupList.Add(NotList);
                        }
                    }
                    hid_syc.Value = KayitSay.ToString();
                    
                }
                catch
                {
                    Response.Redirect("HKS_OzelNotlar.aspx");
                }

            }
            else
            {
                Response.Redirect("HKS_OzelNotlar.aspx");
            }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Control t1 = FindControl("ctl00$MainContent$T_2");
            if (t1!=null)
                if (t1 is TextBox)
                {
                    TextBox T1 = (TextBox)t1;
                    T1.Text = "Buldum";
                }
        }

        protected void btn1_Click(object sender, EventArgs e)
        {

            Control t1 = FindControl("ctl00$MainContent$T1");
            if (t1 != null)
                if (t1 is RadTextBox)
                {
                    RadTextBox T1 = (RadTextBox)t1;
                    T1.Text = "Buldum";
                }

            Control t2 = FindControl("ctl00$MainContent$chk_1");
            if (t2!=null)
                if (t2 is TextBox)
                {
                    TextBox T2 = (TextBox)t2;
                    T2.Text = "Buldum";
                }
        }

        protected void btn_kaydet_Click(object sender, EventArgs e)
        {
            
            String[] msj=txt_baba.Text.Split('|');
            EOBSEntities entitiy = new EOBSEntities();
            int i = 0;
            for (int j = 0; j < GrupList.Count ; j++)
            {
                for (int k = 0; k < GrupList[j].Count; k++)
                {
                    int id=GrupList[j][k].OZN_ID;
                    GrupList[j][k].OZN_NOT = msj[i];
                    OZELNOT ozelnot= entitiy.OZELNOT.First(x=> x.OZN_ID==id);
                    ozelnot.OZN_NOT = msj[i];
                    if (msj[i].Trim() == "")
                    {
                        GrupList[j][k].OZN_AKTIF = false;
                        ozelnot.OZN_AKTIF = false;
                    }
                    else
                    {
                        GrupList[j][k].OZN_AKTIF = true;
                        ozelnot.OZN_AKTIF = true;
                    }
                    i++;
                    entitiy.SaveChanges();
                }
            }
        }

        


    }
}