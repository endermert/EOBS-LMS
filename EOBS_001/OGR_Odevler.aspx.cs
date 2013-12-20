using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;

namespace EOBS_001
{
    public partial class OGR_Odevler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            KULLANICILAR kul = (KULLANICILAR)Session["Kul"];

            if (kul != null)
                if (kul.SUBELER != null)
                    if (kul.OKL_ID != null)
                    {
                      
                        SDS_Odevler.SelectParameters.Clear();
                        SDS_Odevler.SelectParameters.Add("OKL_ID", System.Data.DbType.Int32, kul.OKL_ID.ToString());
                        SDS_Odevler.SelectParameters.Add("SUB_AD", System.Data.DbType.String, "%" + kul.SUBELER.SUB_AD + "%");

                    }
        }
    }
}