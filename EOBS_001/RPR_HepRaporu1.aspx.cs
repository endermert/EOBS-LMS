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
    public partial class RPR_HepRaporu1 : System.Web.UI.Page
    {
        ReportDataSource HEPTABLO;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KulYetki"] != null)
            {
                if (Session["KulYetki"].ToString() == "333" || Session["KulYetki"].ToString() == "444")
                {
                    Panel2.Visible = false;
                    if (Request.QueryString["ref4"] == null)
                        Response.Redirect("RPR_HepRaporu1.aspx?ref4=" + Session["KulId"].ToString());
                }
                else
                {
                    Panel2.Visible = true;
                }
            }
            if (Request.QueryString["ref2"] != null || Request.QueryString["ref3"] != null || Request.QueryString["ref4"] != null)
            {

                Panel1.Visible = true;
                if (!Page.IsPostBack)
                {
                    int OKL_ID = int.Parse(Session["AktifOkulId"].ToString());
                    EOBSEntities entity = new EOBSEntities();
                    //var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == 3 && x.YETKILER.YTK_KODU == 333).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                    //SDS_DersNot.SelectParameters.Clear();
                    //SDS_DersNot.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

                    if (Request.QueryString["ref4"] != null)
                    {
                        int KUL_ID = int.Parse(Request.QueryString["ref4"]);
                        var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333 && x.KUL_ID == KUL_ID).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                        //SDS_DersNot.SelectCommand = SDS_DersNot.SelectCommand + " AND (KULLANICILAR.KUL_ID = " + KUL_ID + ")";
                    }
                    if (Request.QueryString["ref3"] != null)
                    {
                        int SUB_ID = int.Parse(Request.QueryString["ref3"]);
                        var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333 && x.SUB_ID == SUB_ID).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                        //SDS_DersNot.SelectCommand = SDS_DersNot.SelectCommand + " AND (KULLANICILAR.SUB_ID = " + SUB_ID + ")";
                    }
                    if (Request.QueryString["ref2"] != null)
                    {
                        int SNF_ID = int.Parse(Request.QueryString["ref2"]);
                        var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333 && x.SNF_ID == SNF_ID).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                        //SDS_DersNot.SelectCommand = SDS_DersNot.SelectCommand + " AND (KULLANICILAR.SNF_ID = " + SNF_ID + ")";
                    }
                    //if (Request.QueryString["ref2"] == null && Request.QueryString["ref3"] == null && Request.QueryString["ref4"] == null)
                    //{
                    //    var kul = entity.KULLANICILAR.Include("SUBELER").Where(x => x.OKL_ID == OKL_ID && x.YETKILER.YTK_KODU == 333).Select(u => new { u.KUL_ID, u.KUL_NO, u.OKL_ID, u.KUL_ISIM, u.KUL_SOYISIM, u.SUBELER.SUB_AD });
                    //    ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("KULLANICILAR", kul));
                    //}

                   // var id = entity.OKULLAR.First(x => x.OKL_ID == OKL_ID).RSM_ID;
                   // var res = entity.RESIMLER.Where(x => x.RSM_ID == id);


                    //ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("OKULRESIM", res));

                    SDS_HepTablo.SelectParameters.Clear();
                    SDS_HepTablo.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

                    

                    HEPTABLO = new ReportDataSource("HEPTABLO", "SDS_HepTablo");
                    

                    //if (Session["ALTBILGI"] != null)
                    //{
                    //    txtBilgi.Text = Session["ALTBILGI"].ToString();
                    //    ReportViewer1.LocalReport.SetParameters(new ReportParameter("ALTBILGI", txtBilgi.Text));
                    //}

                    ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(SetSubDataSource);

                    this.ReportViewer1.LocalReport.Refresh();
                }
            }
            else
            {
                Panel1.Visible = false;
            }
        }
        public void SetSubDataSource(object sender, SubreportProcessingEventArgs e)
        {
         
            if (e.DataSourceNames.Count > 0)
            {
                for (int i = 0; i < e.DataSourceNames.Count; i++)
                {
                    if (e.DataSourceNames[i] == "HEPTABLO")
                        e.DataSources.Add(HEPTABLO);
                }

            }

        }
        protected void bnt_raporla_Click(object sender, EventArgs e)
        {
            if (cb_Sinif.SelectedIndex != -1)
            {
                //Session["ALTBILGI"] = txtBilgi.Text;
                if (cb_Kul.SelectedIndex != -1)
                    Response.Redirect("RPR_HepRaporu1.aspx?ref4=" + cb_Kul.SelectedValue);
                else
                    if (cb_Sube.SelectedIndex != -1)
                        Response.Redirect("RPR_HepRaporu1.aspx?ref3=" + cb_Sube.SelectedValue);
                    else
                        if (cb_Sinif.SelectedIndex != -1)
                            Response.Redirect("RPR_HepRaporu1.aspx?ref2=" + cb_Sinif.SelectedValue);

            }
        }

        protected void cb_Sube_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "TÜMÜ";
        }

        protected void cb_Sinif_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Sube.SelectedIndex = -1;
            cb_Sube.Text = "TÜMÜ";

            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "TÜMÜ";
        }
    }
}