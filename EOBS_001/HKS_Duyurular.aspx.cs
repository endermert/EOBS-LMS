using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;

namespace EOBS_001
{
    public partial class HKS_Duyurular : System.Web.UI.Page
    {
        private FileUpload fileup;
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
                    EDS_Duyurular.WhereParameters.Clear();
                    EDS_Duyurular.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Duyurular.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                }
                else
                {
                    EDS_Duyurular.WhereParameters.Clear();
                    EDS_Duyurular.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Duyurular.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                    EDS_Duyurular.WhereParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
                }
            }

            try
            {
                
                    EDS_Duyurular.InsertParameters.Clear();
                    EDS_Duyurular.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Duyurular.InsertParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                    EDS_Duyurular.InsertParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
               
            }
            catch
            {

            }

        }

    
        protected void EDS_Duyurular_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            DUYURULAR DYR=(DUYURULAR)e.Entity;
            int i = DYR.DYR_ID;

            EOBSEntities entity = new EOBSEntities();
            var subeler = entity.SUBELER.Where(x => x.OKL_ID == DYR.OKL_ID);

            if (DYR.SUB_ADS != null)
            {
                String[] SUB_ADS= (DYR.SUB_ADS).Split(',');
                for (int j = 0; j < SUB_ADS.Length; j++)
                {
                    foreach (var item in subeler)
                    {
                        if (item.SUB_AD.Trim() == SUB_ADS[j].Trim())
                        {
                            SDS_Ara.InsertParameters["DYR_ID"].DefaultValue = DYR.DYR_ID.ToString();
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
            DUYURULAR DYR = (DUYURULAR)e.Entity;
            int i = DYR.DYR_ID;

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL1 WHERE DYR_ID=" + DYR.DYR_ID;
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
                            SDS_Ara.InsertParameters["DYR_ID"].DefaultValue = DYR.DYR_ID.ToString();
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
            DUYURULAR DYR = new DUYURULAR();
            DYR = (DUYURULAR)e.Entity;
            int i = DYR.DYR_ID;

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL1 WHERE DYR_ID=" + DYR.DYR_ID;
            SDS_Ara.Delete();


        }

        protected void EDS_Duyurular_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            //string yol = fileup.FileName;
            DUYURULAR DYR = (DUYURULAR)e.Entity;
            if (DYR.DYR_AD != null)
                DYR.DYR_AD = DYR.DYR_AD.ToUpper();
            DYR.DRY_TAR = DateTime.Now;
        }

    }
}