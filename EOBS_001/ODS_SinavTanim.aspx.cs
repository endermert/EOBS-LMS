using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class ODS_SinavTanim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

            EDS_Sinavlar.WhereParameters.Clear();
            EDS_Sinavlar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

            EDS_Sinif.WhereParameters.Clear();
            EDS_Sinif.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

            EDS_Sinavlar.InsertParameters.Clear();
            EDS_Sinavlar.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
        }

        protected void GridDamla_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridDamla.SelectedValue != null)
                Response.Redirect("ODS_SinavCevap.aspx?ref=" + GridDamla.SelectedValue.ToString());
        }

        protected void EDS_Sinavlar_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            SINAVLAR snv = (SINAVLAR)e.Entity;
            if (snv != null)
            {
                snv.SNV_AD = snv.SNV_AD.ToUpper();
                snv.SNV_EKLTAR = DateTime.Now;
            }
        }

        protected void EDS_Sinavlar_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            SINAVLAR snv = (SINAVLAR)e.Entity;
            if (snv != null)
                snv.SNV_AD = snv.SNV_AD.ToUpper();
        }
    }
}