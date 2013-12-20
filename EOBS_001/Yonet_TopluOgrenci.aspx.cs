using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBS_001.Kontrol;
using EOBSModel;

namespace EOBS_001
{
    public partial class Yonet_TopluOgrenci : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Session["TopluOgrenci"] != null)
                {
                    Panel1.Visible = true;
                    GridDamla.DataSource = (DataTable)Session["TopluOgrenci"];
                    GridDamla.Rebind();

                }
            }
            else
            {
                Session.Remove("TopluOgrenci");
                Panel1.Visible = false;
            }
        }

        protected void btn_upload_Click(object sender, EventArgs e)
        {
            if (fileUp.HasFile)
            {
                if (fileUp.PostedFile.ContentType == "application/vnd.ms-excel")
                {
                    if (fileUp.PostedFile.ContentLength < 102400)
                    {
                        string filename = Path.GetFileName(fileUp.FileName);
                        string yol = Server.MapPath("~/CVSUP/") + filename;
                        fileUp.SaveAs(yol);
                        lbl_msg.Text = "Dosya yüklendi..";

                        //create object for CSVReader and pass the stream
                        CSVReader reader = new CSVReader(fileUp.PostedFile.InputStream,System.Text.Encoding.Default);
                        //get the header
                        string[] headers = reader.GetCSVLine();        
                        DataTable dt = new DataTable();
                        //add headers
                        foreach (string strHeader in headers)
                            dt.Columns.Add(strHeader);
                        dt.Columns.Add("EKLENDİ",typeof(string));
                        int syc = 0;
                        string[] data;
                        while ((data = reader.GetCSVLine()) != null)
                        {
                            syc++;
                            dt.Rows.Add(data);
                            dt.Rows[syc-1][dt.Columns.Count - 1] = "HAYIR";
                        }
                        
                        if (syc > 0)
                        GridDamla.PageSize = syc;
                        GridDamla.DataSource = dt;
                        GridDamla.DataBind();
                        Session["TopluOgrenci"] = dt;
                        Panel1.Visible = true;
                    }
                }
            }
        }

        protected void btn_Kaydet_Click(object sender, EventArgs e)
        {
            if (Session["TopluOgrenci"] != null)
            {
                
                DataTable dt = (DataTable)Session["TopluOgrenci"];
                EOBSEntities entity = new EOBSEntities();
                KULLANICILAR kul;
                Random r = new Random();
                int syc = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    try
                    {
                        string Durum = "EVET";
                        String tcno = dt.Rows[i][4].ToString().Trim();
                        String veliAd = dt.Rows[i][5].ToString().ToUpper();
                        String veliSAd=dt.Rows[i][3].ToString().ToUpper();
                        String kulAd = Fonk.TrKrktrYokEt(veliAd.Substring(0, 1) + "." + veliSAd, true);

                        try
                        {
                            kul = entity.KULLANICILAR.First(x=> x.KUL_AD==kulAd && x.KUL_TCNO==tcno);
                            Durum = "GÜNCEL";
                        }
                        catch
                        {
                            kul = new KULLANICILAR();
                        }

                        
                        kul.OKL_ID = int.Parse(Session["AktifOkulId"].ToString());
                        kul.KUL_NO = int.Parse(dt.Rows[i][0].ToString());
                        kul.KUL_ISIM = dt.Rows[i][2].ToString().ToUpper();
                        kul.KUL_SOYISIM = veliSAd;
                        kul.KUL_ADSOYAD = kul.KUL_ISIM + " " + kul.KUL_SOYISIM;
                        kul.KUL_TCNO = dt.Rows[i][4].ToString().Trim();
                        kul.KUL_VISIM = veliAd;
                        kul.KUL_TEL1 = dt.Rows[i][6].ToString().Trim();
                        if (dt.Rows[i][7].ToString().Trim() == "E")
                            kul.KUL_CINSIYET = "ERKEK";
                        if (dt.Rows[i][7].ToString().Trim() == "K")
                            kul.KUL_CINSIYET = "KADIN";

                        kul.KUL_AD = kulAd;
                        if (Durum != "GÜNCEL")
                            kul.KUL_SIFRE = r.Next(100000, 1000000).ToString();

                        kul.YTK_ID = 3;
                        kul.KUL_AKTIF = true;
                        kul.KUL_OLSTAR = DateTime.Now;
                        string sub_ad = dt.Rows[i][1].ToString().Trim();
                        SUBELER sube = entity.SUBELER.First(x => x.OKL_ID == kul.OKL_ID && x.SUB_AD == sub_ad);
                        kul.SUB_ID = sube.SUB_ID;
                        kul.SNF_ID = sube.SNF_ID;
                        if (Durum != "GÜNCEL")
                            entity.KULLANICILAR.Add(kul);
                        dt.Rows[i][dt.Columns.Count - 1] = Durum;
                    }
                    catch
                    {
                        syc++;
                        dt.Rows[i][dt.Columns.Count - 1] = "HAYIR";
                        lbl_msg.ForeColor = Color.Red;

                    }
                }
                
                lbl_msg.Text = dt.Rows.Count.ToString() + " Kişi Kayıt Edildi, " + syc.ToString() + " Kişi Kayıt Edilemedi.";

                entity.SaveChanges();
                GridDamla.DataSource = dt;
                GridDamla.Rebind();
                Panel1.Visible = true;
            }
        }
    }
}