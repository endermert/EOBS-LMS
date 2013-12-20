using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class HKS_DegerEgitimi : System.Web.UI.Page
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

            if (Session["KulYetki"] != null)
            {
                if (Session["KulYetki"].ToString() == "111") //yönetici
                {
                    EDS_Degerler.WhereParameters.Clear();
                    EDS_Degerler.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Degerler.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                }
                else
                {
                    EDS_Degerler.WhereParameters.Clear();
                    EDS_Degerler.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Degerler.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                    EDS_Degerler.WhereParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
                }
            }

            try
            {

                EDS_Degerler.InsertParameters.Clear();
                EDS_Degerler.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                EDS_Degerler.InsertParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                EDS_Degerler.InsertParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());

            }
            catch
            {

            }
        }

        protected void EDS_Duyurular_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            DEGEREGITIM DYR = (DEGEREGITIM)e.Entity;
            int i = DYR.DGE_ID;

            EOBSEntities entity = new EOBSEntities();
            var subeler = entity.SUBELER.Where(x => x.OKL_ID == DYR.OKL_ID);

            if (DYR.SUB_ADS != null)
            {
                String[] SUB_ADS = (DYR.SUB_ADS).Split(',');
                for (int j = 0; j < SUB_ADS.Length; j++)
                {
                    foreach (var item in subeler)
                    {
                        if (item.SUB_AD.Trim() == SUB_ADS[j].Trim())
                        {
                            SDS_Ara.InsertParameters["DYR_ID"].DefaultValue = DYR.DGE_ID.ToString();
                            SDS_Ara.InsertParameters["SUB_ID"].DefaultValue = item.SUB_ID.ToString();
                            SDS_Ara.InsertParameters["HFT_ID"].DefaultValue = DYR.HFT_ID.ToString();
                            SDS_Ara.Insert();
                        }

                    }


                }
            }

        }

        protected void EDS_Duyurular_Updated(object sender, EntityDataSourceChangedEventArgs e)
        {
            DEGEREGITIM DYR = (DEGEREGITIM)e.Entity;
            int i = DYR.DGE_ID;

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL1 WHERE DYR_ID=" + DYR.DGE_ID;
            SDS_Ara.Delete();

            EOBSEntities entity = new EOBSEntities();
            if (DYR.OKL_ID == null || Session["AktifOkulId"] != null)
                DYR.OKL_ID = int.Parse(Session["AktifOkulId"].ToString());

            var subeler = entity.SUBELER.Where(x => x.OKL_ID == DYR.OKL_ID);


            if (DYR.SUB_ADS != null)
            {
                String[] SUB_ADS = (DYR.SUB_ADS).Split(',');
                for (int j = 0; j < SUB_ADS.Length; j++)
                {
                    foreach (var item in subeler)
                    {
                        if (item.SUB_AD.Trim() == SUB_ADS[j].Trim())
                        {
                            SDS_Ara.InsertParameters["DYR_ID"].DefaultValue = DYR.DGE_ID.ToString();
                            SDS_Ara.InsertParameters["SUB_ID"].DefaultValue = item.SUB_ID.ToString();
                            SDS_Ara.InsertParameters["HFT_ID"].DefaultValue = DYR.HFT_ID.ToString();
                            SDS_Ara.Insert();
                        }

                    }


                }
            }

        }

        protected void EDS_Duyurular_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            DEGEREGITIM DYR = new DEGEREGITIM();
            DYR = (DEGEREGITIM)e.Entity;
            int i = DYR.DGE_ID;

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL1 WHERE DYR_ID=" + DYR.DGE_ID;
            SDS_Ara.Delete();


        }

        protected void EDS_Duyurular_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            DEGEREGITIM DYR = (DEGEREGITIM)e.Entity;
            if (DYR.DGE_AD != null)
                DYR.DGE_AD = DYR.DGE_AD.ToUpper();
            DYR.DGE_TAR = DateTime.Now;
        }
    }
}