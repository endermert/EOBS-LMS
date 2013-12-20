using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class OGR_BanaOzel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             KULLANICILAR kul = (KULLANICILAR)Session["Kul"];

             if (kul!=null)
                if (kul.SUBELER!=null)
                    if (kul.OKL_ID != null)
                    {
                        SDS_OzelNot.SelectParameters.Clear();
                        SDS_OzelNot.SelectParameters.Add("KUL_ID", System.Data.DbType.Int32, kul.KUL_ID.ToString());
                    }

        }
    }
}