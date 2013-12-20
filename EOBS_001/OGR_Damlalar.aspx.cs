using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class OGR_Damlalar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            KULLANICILAR kul = (KULLANICILAR)Session["Kul"];

            if (kul != null)
                if (kul.SUBELER != null)
                    if (kul.OKL_ID != null)
                    {
                        if (Session["OkulTur"].ToString() != "111")
                        {
                            SDS_Damlaciklar.SelectParameters.Clear();
                            SDS_Damlaciklar.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, kul.OKL_ID.ToString());
                            SDS_Damlaciklar.SelectParameters.Add("SUB_AD", System.Data.DbType.String, "%" + kul.SUBELER.SUB_AD + "%");
                        }
                        if (Session["OkulTur"].ToString() == "111")
                        {
                            SDS_Damlaciklar1.SelectParameters.Clear();
                            SDS_Damlaciklar1.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, kul.OKL_ID.ToString());
                            SDS_Damlaciklar1.SelectParameters.Add("SUB_AD", System.Data.DbType.String, "%" + kul.SUBELER.SUB_AD + "%");
                        }
                    }
        }
    }
}