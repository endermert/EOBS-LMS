using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBS_001.Kontrol;
using EOBSModel;
using System.Data;
using System.Collections;
namespace EOBS_001
{
    public partial class Site : System.Web.UI.MasterPage
    {
        KULLANICILAR kul = new KULLANICILAR();
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (Session["Sayfalar"] == null)
            {
                List<SAYFALAR> Sayfalar = new List<SAYFALAR>();
                EOBSEntities entity = new EOBSEntities();
                if (Session["KulYetki"] == null)
                {
                    Sayfalar = entity.SAYFALAR.Where(x => x.SYF_MISAFIR == true).ToList<SAYFALAR>();
                }
                else
                {
                    if (Session["KulYetki"].ToString() == "111")
                        Sayfalar = entity.SAYFALAR.Where(x => x.SYF_ADMIN == true).ToList<SAYFALAR>();
                    if (Session["KulYetki"].ToString() == "222")
                        Sayfalar = entity.SAYFALAR.Where(x => x.SYF_OGRETMEN == true).ToList<SAYFALAR>();
                    if (Session["KulYetki"].ToString() == "333")
                        Sayfalar = entity.SAYFALAR.Where(x => x.SYF_OGRENCI == true).ToList<SAYFALAR>();
                    if (Session["KulYetki"].ToString() == "444")
                        Sayfalar = entity.SAYFALAR.Where(x => x.SYF_VELI == true).ToList<SAYFALAR>();
                }

                Session["Sayfalar"] = Sayfalar;
            }

            if (Session["Sayfalar"] != null)
            {
                List<SAYFALAR> Sayfalar = new List<SAYFALAR>();
                Sayfalar = (List<SAYFALAR>)Session["Sayfalar"];
                Boolean yetki = false;
                for (int i = 0; i < Sayfalar.Count; i++)
                {
                    
                    if (Request.Path.IndexOf(Sayfalar[i].SYF_AD) != -1)
                    {
                        yetki = true;
                        break;
                    }
                }
                if (yetki == false)
                    Response.Redirect("Yetki.html");
            }

            if (Request.QueryString["ref"] != null)
            {
                if (Request.QueryString["ref"] == "logout")
                {
                    Session.Abandon();
                    Session.Clear(); 
                }
            }

            if (Session["kulAd"] == null || Session["kulSifre"] == null || Session["kul"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else 
            {
                kul = (KULLANICILAR)Session["kul"];
                lblYetki.Text = Fonk.TrKrktrYokEt(kul.YETKILER.YTK_AD.ToUpper(),true); 
                lblIsim.Text = kul.KUL_ISIM + " " + kul.KUL_SOYISIM;
            }

            
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

            if (Session["AktifOkulAd"] != null)
                lblAktifOkulAd.Text = Session["AktifOkulAd"].ToString();
            else
                lblAktifOkulAd.Text = "IŞIK EĞİTİM KURUMLARI";

            if (Session["AktifHaftaId"] == null)
            {
                DS1.SelectCommand = "SELECT HFT_ID FROM HAFTALAR WHERE HFT_AKTIF=1";
                DS1.SelectCommandType = SqlDataSourceCommandType.Text;
                DataSourceSelectArguments arg=new DataSourceSelectArguments();
                DataView dv = new DataView();
                DataTable dt = new DataTable();
                dv = (DataView)DS1.Select(arg);
                dt = dv.ToTable();
                Session["AktifHaftaId"]=dt.Rows[0][0].ToString();
                String ss = dt.Rows[0][0].ToString(); 
            //}
            //else
            //{

            //    lblAktifOkulAd.Text = "Işık Eğitim Kurumları";
            }
            
                

        }

        //protected void btnCikis_Click(object sender, EventArgs e)
        //{
        //    Glo.AktifKul = null;
        //    Response.Redirect("Giris.aspx");
        //}
    }
}