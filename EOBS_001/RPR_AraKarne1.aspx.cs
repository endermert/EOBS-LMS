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
    public partial class RPR_AraKarne1 : System.Web.UI.Page
    {
        ReportDataSource DUYURULAR;
        ReportDataSource ODEVLER;
        ReportDataSource DAMLACIKLAR;
        ReportDataSource OZELNOT;
        ReportDataSource ODEVSNC;
        ReportDataSource SINAVLAR;
        ReportDataSource DERSNOT;
        ReportDataSource DEVAM;
        ReportDataSource DAVRANIS;
        ReportDataSource HEPTABLO;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KulYetki"] != null)
            {
                if (Session["KulYetki"].ToString() == "333" || Session["KulYetki"].ToString() == "444")
                {
                    Panel2.Visible = false;
                    PanelOgr.Visible = true;
                }
                else
                {
                    Panel2.Visible = true;
                    PanelOgr.Visible = false;
                }
            }

            if (Request.QueryString["ref1"] != null)
            {
                
                Panel1.Visible = true;
                if (!Page.IsPostBack)
                {
                    int HFT_ID = int.Parse(Request.QueryString["ref1"]);
                    int OKL_ID = int.Parse(Session["AktifOkulId"].ToString());
                    EOBSEntities entity = new EOBSEntities();
                    //var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == 3 && x.YETKILER.YTK_KODU == 333).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                    SDS_DersNot.SelectParameters.Clear();
                    SDS_DersNot.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

                    if (Request.QueryString["ref4"] != null)
                    {
                        int KUL_ID = int.Parse(Request.QueryString["ref4"]);
                        var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333 && x.KUL_ID==KUL_ID).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD,u.KUL_DAVNOT });
                        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                        SDS_DersNot.SelectCommand = SDS_DersNot.SelectCommand + " AND (KULLANICILAR.KUL_ID = " + KUL_ID + ")";
                    }
                    if (Request.QueryString["ref3"] != null)
                    {
                        int SUB_ID = int.Parse(Request.QueryString["ref3"]);
                        var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333 && x.SUB_ID == SUB_ID).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD, u.KUL_DAVNOT });
                        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                        SDS_DersNot.SelectCommand = SDS_DersNot.SelectCommand + " AND (KULLANICILAR.SUB_ID = " + SUB_ID + ")";
                    }
                    if (Request.QueryString["ref2"] != null)
                    {
                        int SNF_ID = int.Parse(Request.QueryString["ref2"]);
                        var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333 && x.SNF_ID == SNF_ID).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD, u.KUL_DAVNOT });
                        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                        SDS_DersNot.SelectCommand = SDS_DersNot.SelectCommand + " AND (KULLANICILAR.SNF_ID = " + SNF_ID + ")";
                    }
                    if (Request.QueryString["ref2"] == null && Request.QueryString["ref3"] == null && Request.QueryString["ref4"] == null)
                    {
                        var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD, u.KUL_DAVNOT });
                        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                    }
                    
                    var id = entity.OKULLAR.First(x => x.OKL_ID == OKL_ID).RSM_ID;
                    var res = entity.RESIMLER.Where(x => x.RSM_ID == id);

                    
                    ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("OKULRESIM", res));

                    SDS_Duyurular.SelectParameters.Clear();
                    SDS_Duyurular.SelectParameters.Add("OKL_ID",System.Data.DbType.Int32,Session["AktifOkulId"].ToString());
                    //SDS_Duyurular.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    SDS_Odevler.SelectParameters.Clear();
                    SDS_Odevler.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_Odevler.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    SDS_Damlaciklar.SelectParameters.Clear();
                    SDS_Damlaciklar.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_Damlaciklar.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    SDS_OzelNot.SelectParameters.Clear();
                    SDS_OzelNot.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_OzelNot.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    SDS_OdevSnc.SelectParameters.Clear();
                    SDS_OdevSnc.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_OdevSnc.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    SDS_Sinavlar.SelectParameters.Clear();
                    SDS_Sinavlar.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_Sinavlar.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    SDS_Devamsiz.SelectParameters.Clear();
                    SDS_Devamsiz.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

                    SDS_Davranis.SelectParameters.Clear();
                    SDS_Davranis.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

                    SDS_HepTablo.SelectParameters.Clear();
                    SDS_HepTablo.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

                    DUYURULAR = new ReportDataSource("DUYURULAR", "SDS_Duyurular");
                    ODEVLER = new ReportDataSource("ODEVLER", "SDS_Odevler");
                    DAMLACIKLAR= new ReportDataSource("DAMLACIKLAR", "SDS_Damlaciklar");
                    OZELNOT = new ReportDataSource("OZELNOT", "SDS_OzelNot");
                    ODEVSNC = new ReportDataSource("ODEVSNC", "SDS_OdevSnc");
                    SINAVLAR = new ReportDataSource("SINAVLAR", "SDS_Sinavlar");
                    DERSNOT = new ReportDataSource("DERSNOT", "SDS_DersNot");
                    DEVAM = new ReportDataSource("DEVAM", "SDS_Devamsiz");
                    DAVRANIS = new ReportDataSource("DAVRANIS", "SDS_Davranis");
                    HEPTABLO = new ReportDataSource("HEPTABLO", "SDS_HepTablo");

                    if (Session["ALTBILGI"]!=null)
                    {
                        txtBilgi.Text = Session["ALTBILGI"].ToString();
                        ReportViewer1.LocalReport.SetParameters(new ReportParameter("ALTBILGI",txtBilgi.Text));
                    }

                    ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(SetSubDataSource);
                    
                    this.ReportViewer1.LocalReport.Refresh();
                }
            }
            else
            {
                Panel1.Visible = false;
            }

            
        }
        int syc = 0;
        public void SetSubDataSource(object sender, SubreportProcessingEventArgs e)
        {
            syc++;
            if (e.DataSourceNames.Count > 0)
            {
                if (e.DataSourceNames.Count==3)
                {
                    e.DataSources.Add(DUYURULAR);
                    e.DataSources.Add(ODEVLER);
                    e.DataSources.Add(DAMLACIKLAR);
                }
                if (e.DataSourceNames[0]=="OZELNOT")
                    e.DataSources.Add(OZELNOT);

                if (e.DataSourceNames[0] == "ODEVSNC")
                    e.DataSources.Add(ODEVSNC);

                if (e.DataSourceNames[0] == "SINAVLAR")
                    e.DataSources.Add(SINAVLAR);

                if (e.DataSourceNames[0] == "DERSNOT")
                    e.DataSources.Add(DERSNOT);

                if (e.DataSourceNames[0] == "DEVAM")
                    e.DataSources.Add(DEVAM);

                if (e.DataSourceNames[0] == "DAVRANIS")
                    e.DataSources.Add(DAVRANIS);
                
                if (e.DataSourceNames[0] == "HEPTABLO")
                    e.DataSources.Add(HEPTABLO);
            }
            //e.DataSources.Add(new ReportDataSource("DUYURULAR", "SqlDataSource1"));
            //e.DataSources.Add(new ReportDataSource("ODEVLER", "SqlDataSource3"));
            //e.DataSources.Add(new ReportDataSource("DAMLACIKLAR", "SqlDataSource4"));
            //e.DataSources.Add(new ReportDataSource("OZELNOT", "SqlDataSource5"));
            //e.DataSources.Add(new ReportDataSource("ODEVSNC", "SqlDataSource6"));

        }
        protected void bnt_raporla_Click(object sender, EventArgs e)
        {
    
                //if (cb_Hafta.SelectedIndex != -1)
                //{
                    Session["ALTBILGI"] = txtBilgi.Text;
                    if (cb_Kul.SelectedIndex!=-1)
                        Response.Redirect("RPR_AraKarne1.aspx?ref1=1&ref4=" + cb_Kul.SelectedValue);
                    else
                        if (cb_Sube.SelectedIndex!=-1)
                            Response.Redirect("RPR_AraKarne1.aspx?ref1=1&ref3=" + cb_Sube.SelectedValue);
                        else
                            if (cb_Sinif.SelectedIndex!=-1)
                                Response.Redirect("RPR_AraKarne1.aspx?ref1=1&ref2=" + cb_Sinif.SelectedValue);

                    //if (cb_Kul.SelectedIndex == -1 && cb_Sube.SelectedIndex == -1 && cb_Sinif.SelectedIndex == -1)
                    //{
                    //    Response.Redirect("RPR_AraKarne1.aspx?ref1=" + cb_Hafta.SelectedValue);
                    //}

                //}
                

        }

        protected void cb_Sinif_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Sube.SelectedIndex = -1;
            cb_Sube.Text = "TÜMÜ";

            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "TÜMÜ";
        }

        protected void cb_Sube_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "TÜMÜ";
        }

        protected void btn_RaporlaOgr_Click(object sender, EventArgs e)
        {
            //if (cb_HaftaOgr.SelectedIndex != -1)
            //{
                Response.Redirect("RPR_AraKarne1.aspx?ref1=1&ref4=" + Session["KulId"].ToString());
            //}
        }


    }
}