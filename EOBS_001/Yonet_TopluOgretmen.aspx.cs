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
    public partial class Yonet_TopluOgretmen : System.Web.UI.Page
    {
        private int OKL_ID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Session["TopluOgretmen"] != null)
                {
                    Panel1.Visible = true;
                    GridDamla.DataSource = (DataTable)Session["TopluOgretmen"];
                    GridDamla.Rebind();

                }
            }
            else
            {
                Session.Remove("TopluOgretmen");
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
                        CSVReader reader = new CSVReader(fileUp.PostedFile.InputStream, System.Text.Encoding.Default);
                        //get the header
                        string[] headers = reader.GetCSVLine();
                        DataTable dt = new DataTable();
                        //add headers
                        foreach (string strHeader in headers)
                            dt.Columns.Add(strHeader);
                        dt.Columns.Add("EKLENDİ", typeof(string));
                        int syc = 0;
                        string[] data;
                        while ((data = reader.GetCSVLine()) != null)
                        {
                            syc++;
                            dt.Rows.Add(data);
                            dt.Rows[syc - 1][dt.Columns.Count - 1] = "HAYIR";
                        }
                        //bind gridview
                        if (syc>0)
                        GridDamla.PageSize = syc;
                        GridDamla.DataSource = dt;
                        GridDamla.DataBind();
                        Session["TopluOgretmen"] = dt;
                        Panel1.Visible = true;
                    }
                }
            }
        }

        protected void btn_Kaydet_Click(object sender, EventArgs e)
        {
            if (Session["TopluOgretmen"] != null)
            {

                DataTable dt = (DataTable)Session["TopluOgretmen"];
                EOBSEntities entity = new EOBSEntities();
                KULLANICILAR kul;
                Random r = new Random();
                int syc = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    try
                    {
                        string Durum = "EVET";
                        OKL_ID= int.Parse(Session["AktifOkulId"].ToString());
                        String tcno = dt.Rows[i][2].ToString().Trim();
                        String kulisim = dt.Rows[i][0].ToString().ToUpper();
                        String kulsisim = dt.Rows[i][1].ToString().ToUpper();
                        String kulAd = Fonk.TrKrktrYokEt(kulisim.Substring(0, 2) + "." + kulsisim, true);
                        try
                        {
                            kul = entity.KULLANICILAR.First(x => x.KUL_AD == kulAd && x.KUL_TCNO == tcno);
                            Durum = "GÜNCEL";
                        }
                        catch
                        {
                            kul = new KULLANICILAR();
                        }
                        int.Parse(Session["AktifOkulId"].ToString());
                        kul.OKL_ID = OKL_ID;
                        //kul.KUL_NO = int.Parse(dt.Rows[i][0].ToString());
                        kul.KUL_ISIM = dt.Rows[i][0].ToString().ToUpper();
                        kul.KUL_SOYISIM = dt.Rows[i][1].ToString().ToUpper();
                        kul.KUL_ADSOYAD = kul.KUL_ISIM + " " + kul.KUL_SOYISIM;
                        kul.KUL_TCNO = dt.Rows[i][2].ToString().Trim();
                        //kul.KUL_VISIM = dt.Rows[i][5].ToString().ToUpper();
                        kul.KUL_TEL1 = dt.Rows[i][3].ToString().Trim();
                        if (dt.Rows[i][4].ToString().Trim() == "E" || dt.Rows[i][4].ToString().Trim() == "e")
                            kul.KUL_CINSIYET = "ERKEK";
                        if (dt.Rows[i][4].ToString().Trim() == "K" || dt.Rows[i][4].ToString().Trim() == "k")
                            kul.KUL_CINSIYET = "KADIN";
                        
                        kul.KUL_AD = kulAd;
                        if (Durum != "GÜNCEL")
                            kul.KUL_SIFRE = r.Next(100000, 1000000).ToString();

                        kul.YTK_ID = 2;
                        kul.KUL_AKTIF = true;
                        kul.KUL_OLSTAR = DateTime.Now;
                        SUBELER sube;
                        string reh;
                        try
                        {
                            reh = dt.Rows[i][6].ToString().Trim();
                            sube = entity.SUBELER.First(x => x.OKL_ID == OKL_ID && x.SUB_AD == reh);
                            kul.RE1_ID = sube.SUB_ID;
                        }
                        catch{ }
                        try
                        {
                            reh = dt.Rows[i][7].ToString().Trim();
                            sube = entity.SUBELER.First(x => x.OKL_ID == OKL_ID && x.SUB_AD == reh);
                            kul.RE2_ID = sube.SUB_ID;
                        }
                        catch { }

                        try
                        {
                            reh = dt.Rows[i][8].ToString().Trim();
                            sube = entity.SUBELER.First(x => x.OKL_ID == OKL_ID && x.SUB_AD == reh);
                            kul.RE3_ID = sube.SUB_ID;
                        }
                        catch { }

                        BRANSLAR brans;
                        try
                        {
                            String brns = dt.Rows[i][5].ToString();
                            brans = entity.BRANSLAR.First(x => x.BRS_AD==brns);
                            kul.BRS_ID = brans.BRS_ID;
                        }
                        catch { }

                        //kul.SNF_ID = sube.SNF_ID;
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