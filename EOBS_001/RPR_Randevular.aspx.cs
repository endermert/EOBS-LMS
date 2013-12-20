using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EOBS_001
{
    public partial class RPR_Randevular : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ref"] != null)
            {
                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
        }

        protected void bnt_raporla_Click(object sender, EventArgs e)
        {
            if (cb_Randevu.SelectedIndex != -1)
            {
                Response.Redirect("RPR_Randevular.aspx?ref="+cb_Randevu.SelectedValue.ToString());
            }
        }
    }
}