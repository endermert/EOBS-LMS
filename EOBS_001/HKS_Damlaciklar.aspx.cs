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
    public partial class HKS_Damlaciklar : System.Web.UI.Page
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
                    EDS_Damlaciklar.WhereParameters.Clear();
                    EDS_Damlaciklar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Damlaciklar.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                }
                else
                {
                    EDS_Damlaciklar.WhereParameters.Clear();
                    EDS_Damlaciklar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Damlaciklar.WhereParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                    EDS_Damlaciklar.WhereParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
                }
            }

            try
            {
                if (EDS_Damlaciklar.InsertParameters.Count == 0)
                {
                    EDS_Damlaciklar.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
                    EDS_Damlaciklar.InsertParameters.Add("HFT_ID", System.Data.DbType.Int32, Session["AktifHaftaId"].ToString());
                    EDS_Damlaciklar.InsertParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
                }
            }
            catch
            {

            }
        }

    
        protected void EDS_Damlaciklar_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            DAMLACIKLAR DML=new DAMLACIKLAR();
            DML = (DAMLACIKLAR)e.Entity;
            int i = DML.DML_ID;

            EOBSEntities entity = new EOBSEntities();
            var subeler = entity.SUBELER.Where(x => x.OKL_ID == DML.OKL_ID);

            if (DML.SUB_ADS != null)
            {

                String[] SUB_ADS= (DML.SUB_ADS).Split(',');
                for (int j = 0; j < SUB_ADS.Length; j++)
                {
                    foreach (var item in subeler)
                    {
                        if (item .SUB_AD.Trim() == SUB_ADS[j].Trim())
                        {
                            SDS_Ara.InsertParameters["DML_ID"].DefaultValue = DML.DML_ID.ToString();
                            SDS_Ara.InsertParameters["SUB_ID"].DefaultValue = item.SUB_ID.ToString();
                            SDS_Ara.InsertParameters["HFT_ID"].DefaultValue = DML.HFT_ID.ToString();
                            SDS_Ara.Insert();
                        }

                    }
                    

                }
            }
            
        }

        protected void EDS_Damlaciklar_Updated(object sender, EntityDataSourceChangedEventArgs e)
        {
            DAMLACIKLAR DML = new DAMLACIKLAR();
            DML = (DAMLACIKLAR)e.Entity;
            int i = DML.DML_ID;

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL1 WHERE DML_ID=" + DML.DML_ID;
            SDS_Ara.Delete();

            EOBSEntities entity = new EOBSEntities();
            if (DML.OKL_ID==null || Session["AktifOkulId"] != null)
                DML.OKL_ID = int.Parse(Session["AktifOkulId"].ToString());

            var subeler = entity.SUBELER.Where(x => x.OKL_ID == DML.OKL_ID);

            if (DML.SUB_ADS !=null)
            {
                String[] SUB_ADS = (DML.SUB_ADS).Split(',');
                for (int j = 0; j < SUB_ADS.Length; j++)
                {
                    foreach (var item in subeler)
                    {
                        if (item.SUB_AD.Trim() == SUB_ADS[j].Trim())
                        {
                            SDS_Ara.InsertParameters["DML_ID"].DefaultValue = DML.DML_ID.ToString();
                            SDS_Ara.InsertParameters["SUB_ID"].DefaultValue = item.SUB_ID.ToString();
                            SDS_Ara.InsertParameters["HFT_ID"].DefaultValue = DML.HFT_ID.ToString();
                            SDS_Ara.Insert();
                        }

                    }


                }
            }
            
        }

        protected void EDS_Damlaciklar_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            DAMLACIKLAR DML = new DAMLACIKLAR();
            DML = (DAMLACIKLAR)e.Entity;
            int i = DML.DML_ID;

            SDS_Ara.DeleteCommandType = SqlDataSourceCommandType.Text;
            SDS_Ara.DeleteCommand = "DELETE FROM ARA_TBL1 WHERE DML_ID=" + DML.DML_ID;
            SDS_Ara.Delete();


        }

        protected void EDS_Damlaciklar_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            DAMLACIKLAR DML = (DAMLACIKLAR)e.Entity;
            if (DML.DML_AD != null)
                DML.DML_AD = DML.DML_AD.ToUpper();
            DML.DML_TAR = DateTime.Now;
        }
    }
}