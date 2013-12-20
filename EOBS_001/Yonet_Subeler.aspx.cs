using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EOBS_001
{
    public partial class Yonet_Subeler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (EDS_Subeler.InsertParameters.Count == 0)
                EDS_Subeler.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
        }
    }
}