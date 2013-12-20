using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
using Microsoft.Reporting.WebForms;

namespace EOBS_001
{
    public partial class RPR_SinavSonuc1 : System.Web.UI.Page
    {
        ReportDataSource DERSSNC;
        ReportDataSource SNVSNC;
        protected void Page_Load(object sender, EventArgs e)
        {
            chkCvp.Checked = true;
            if (Session["KulYetki"] != null)
            {
                if (Session["KulYetki"].ToString() == "333" || Session["KulYetki"].ToString() == "444")
                {
                    Panel2.Visible = false;
                    PanelOgr.Visible = true;

                    KULLANICILAR kul = (KULLANICILAR)Session["Kul"];
                    SDS_Sinavlar1.SelectParameters.Clear();
                    SDS_Sinavlar1.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    SDS_Sinavlar1.SelectParameters.Add("SNF_ID", System.Data.DbType.Int32, kul.SNF_ID.ToString());

                    
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
                    int SNV_ID = int.Parse(Request.QueryString["ref1"]);
                    int OKL_ID = int.Parse(Session["AktifOkulId"].ToString());
                    EOBSEntities entity = new EOBSEntities();
                    //var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == 3 && x.YETKILER.YTK_KODU == 333).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });

                    
                    SDS_SnvSncKul.SelectParameters.Clear();
                    SDS_SnvSncKul.SelectParameters.Add("OKL_ID",System.Data.DbType.Int32,OKL_ID.ToString());
                    SDS_SnvSncKul.SelectParameters.Add("SNV_ID", System.Data.DbType.Int32, SNV_ID.ToString());

                    if (Request.QueryString["ref4"] != null)
                    {
                        int KUL_ID = int.Parse(Request.QueryString["ref4"]);
                        //var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333 && x.KUL_ID == KUL_ID).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                        //ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                        SDS_SnvSncKul.SelectCommand = SDS_SnvSncKul.SelectCommand + " AND (KULLANICILAR.KUL_ID = "+KUL_ID +")";
                        
                    }
                    if (Request.QueryString["ref3"] != null)
                    {
                        int SUB_ID = int.Parse(Request.QueryString["ref3"]);
                        //var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333 && x.SUB_ID == SUB_ID).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                        //ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));

                        SDS_SnvSncKul.SelectCommand = SDS_SnvSncKul.SelectCommand + " AND (KULLANICILAR.SUB_ID = " + SUB_ID + ")";
                    }
                    if (Request.QueryString["ref2"] != null)
                    {
                        int SNF_ID = int.Parse(Request.QueryString["ref2"]);
                        //var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333 && x.SNF_ID == SNF_ID).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                        //ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                        SDS_SnvSncKul.SelectCommand = SDS_SnvSncKul.SelectCommand + " AND (KULLANICILAR.SNF_ID = " + SNF_ID + ")";
                    }
                    //if (Request.QueryString["ref2"] == null && Request.QueryString["ref3"] == null && Request.QueryString["ref4"] == null)
                    //{
                    //    var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                    //    ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                    //}

                    ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", "SDS_SnvSncKul"));

                    var id = entity.OKULLAR.First(x => x.OKL_ID == OKL_ID).RSM_ID;
                    var res = entity.RESIMLER.Where(x => x.RSM_ID == id);


                    ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("OKULRESIM", res));

                    SDS_DersSnc.SelectParameters.Clear();
                    SDS_DersSnc.SelectParameters.Add("SNV_ID", System.Data.DbType.Int32, SNV_ID.ToString());

                    var snv = entity.SINAVLAR.First(x=> x.SNV_ID==SNV_ID);

                    SDS_SnvSnc.SelectParameters.Clear();
                    SDS_SnvSnc.SelectParameters.Add("SNF_ID", System.Data.DbType.Int32, snv.SNF_ID.ToString());
                    SDS_SnvSnc.SelectParameters.Add("STP_ID", System.Data.DbType.Int16, snv.SINAVDETAY.STP_ID.ToString());
                    if (snv.SINAVDETAY.STP_ID==5)
                        ReportViewer1.LocalReport.SetParameters(new ReportParameter("YGS", "False"));
                    else
                        ReportViewer1.LocalReport.SetParameters(new ReportParameter("YGS", "True"));
                    if (snv.SINAVDETAY.STP_ID == 4)
                        ReportViewer1.LocalReport.SetParameters(new ReportParameter("LYS", "False"));
                    else
                        ReportViewer1.LocalReport.SetParameters(new ReportParameter("LYS", "True"));

                    //SDS_Duyurular.SelectParameters.Clear();
                    //SDS_Duyurular.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_Duyurular.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    //SDS_Odevler.SelectParameters.Clear();
                    //SDS_Odevler.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_Odevler.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    //SDS_Damlaciklar.SelectParameters.Clear();
                    //SDS_Damlaciklar.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_Damlaciklar.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    //SDS_OzelNot.SelectParameters.Clear();
                    //SDS_OzelNot.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_OzelNot.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    //SDS_OdevSnc.SelectParameters.Clear();
                    //SDS_OdevSnc.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_OdevSnc.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    //SDS_Sinavlar.SelectParameters.Clear();
                    //SDS_Sinavlar.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    //SDS_Sinavlar.SelectParameters.Add("HFT_ID", System.Data.DbType.Int32, HFT_ID.ToString());

                    DERSSNC = new ReportDataSource("DERSSNC", "SDS_DersSnc");
                    SNVSNC = new ReportDataSource("SNVSNC", "SDS_SnvSnc");
                    //DUYURULAR = new ReportDataSource("DUYURULAR", "SDS_Duyurular");
                    //ODEVLER = new ReportDataSource("ODEVLER", "SDS_Odevler");
                    //DAMLACIKLAR = new ReportDataSource("DAMLACIKLAR", "SDS_Damlaciklar");
                    //OZELNOT = new ReportDataSource("OZELNOT", "SDS_OzelNot");
                    //ODEVSNC = new ReportDataSource("ODEVSNC", "SDS_OdevSnc");
                    //SINAVLAR = new ReportDataSource("SINAVLAR", "SDS_Sinavlar");

                    
                    if (Session["ALTBILGI"] != null)
                    {
                        txtBilgi.Text = Session["ALTBILGI"].ToString();
                        ReportViewer1.LocalReport.SetParameters(new ReportParameter("ALTBILGI", txtBilgi.Text));
                    }
                    if (PanelOgr.Visible)
                        ReportViewer1.LocalReport.SetParameters(new ReportParameter("CVPLAR","True"));
                    else
                        if (Session["CVPLAR"] != null)
                        {
                            chkCvp.Checked = Boolean.Parse(Session["CVPLAR"].ToString());
                            ReportViewer1.LocalReport.SetParameters(new ReportParameter("CVPLAR",chkCvp.Checked.ToString()));
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
                //if (e.DataSourceNames.Count == 3)
                //{
                //    e.DataSources.Add(DUYURULAR);
                //    e.DataSources.Add(ODEVLER);
                //    e.DataSources.Add(DAMLACIKLAR);
                //}
                //if (e.DataSourceNames[0] == "OZELNOT")
                //    e.DataSources.Add(OZELNOT);

                //if (e.DataSourceNames[0] == "ODEVSNC")
                //    e.DataSources.Add(ODEVSNC);

                //if (e.DataSourceNames[0] == "SINAVLAR")
                //    e.DataSources.Add(SINAVLAR);
                if (e.DataSourceNames[0] == "DERSSNC")
                    e.DataSources.Add(DERSSNC);

                if (e.DataSourceNames[0] == "SNVSNC")
                    e.DataSources.Add(SNVSNC);
            }
            //e.DataSources.Add(new ReportDataSource("DUYURULAR", "SqlDataSource1"));
            //e.DataSources.Add(new ReportDataSource("ODEVLER", "SqlDataSource3"));
            //e.DataSources.Add(new ReportDataSource("DAMLACIKLAR", "SqlDataSource4"));
            //e.DataSources.Add(new ReportDataSource("OZELNOT", "SqlDataSource5"));
            //e.DataSources.Add(new ReportDataSource("ODEVSNC", "SqlDataSource6"));

        }

        protected void cb_Sinif_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Sube.SelectedIndex = -1;
            cb_Sube.Text = "TÜMÜ";

            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "TÜMÜ";

            cb_Sinav.SelectedIndex = -1;
            cb_Sinav.Text = "SEÇİNİZ..";
        }

        protected void cb_Sube_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "TÜMÜ";
        }

        protected void bnt_raporla_Click(object sender, EventArgs e)
        {
            if (cb_Sinav.SelectedIndex != -1)
            {
                Session["ALTBILGI"] = txtBilgi.Text;
                Session["CVPLAR"] = chkCvp.Checked.ToString();

                if (cb_Kul.SelectedIndex != -1)
                    Response.Redirect("RPR_SinavSonuc1.aspx?ref1=" + cb_Sinav.SelectedValue + "&ref4=" + cb_Kul.SelectedValue);
                else
                    if (cb_Sube.SelectedIndex != -1)
                        Response.Redirect("RPR_SinavSonuc1.aspx?ref1=" + cb_Sinav.SelectedValue + "&ref3=" + cb_Sube.SelectedValue);
                    else
                        if (cb_Sinif.SelectedIndex != -1)
                            Response.Redirect("RPR_SinavSonuc1.aspx?ref1=" + cb_Sinav.SelectedValue + "&ref2=" + cb_Sinif.SelectedValue);

                //if (cb_Kul.SelectedIndex == -1 && cb_Sube.SelectedIndex == -1 && cb_Sinif.SelectedIndex == -1)
                //{
                //    Response.Redirect("RPR_HaftalikKarne1.aspx?ref1=" + cb_Sinav.SelectedValue);
                //}

            }
        }

        protected void btn_RaporlaOgr_Click(object sender, EventArgs e)
        {
            if (cb_SinavOgr.SelectedIndex != -1)
            {
                Response.Redirect("RPR_SinavSonuc1.aspx?ref1=" + cb_SinavOgr.SelectedValue + "&ref4=" + Session["KulId"].ToString());
            }
        }

      
    }
}