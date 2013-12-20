using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EOBS_001
{
    public partial class Yonet_Haftalar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RC_Kur_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            //int i = RC_Kur.SelectedIndex;
        }

        protected void GridHafta_SelectedIndexChanged(object sender, EventArgs e)
        {

            DS1.UpdateCommand = "UPDATE HAFTALAR SET HFT_AKTIF=0";
            DS1.UpdateCommandType = SqlDataSourceCommandType.Text;
            DS1.Update();

            String index=GridHafta.SelectedValue.ToString();
            Session["AktifHaftaId"] = index;
            DS1.UpdateCommand = "UPDATE HAFTALAR SET HFT_AKTIF=1 WHERE HFT_ID="+index ;
            DS1.Update();

            GridHafta.Rebind();
        }
    }
}