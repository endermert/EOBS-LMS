using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class OGR_Sinavlar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Grid1_SelectedIndexChanged(object sender, EventArgs e)
        {
           String SNS_ID =Grid1.SelectedValue.ToString();
           Response.Redirect("OGR_SinavDetay.aspx?ref1="+SNS_ID);
        }
    }
}