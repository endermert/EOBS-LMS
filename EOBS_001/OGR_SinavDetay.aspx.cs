using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class OGR_SinavDetay : System.Web.UI.Page
    {
        int KUL_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KulId"] != null)
                KUL_ID = int.Parse(Session["KulId"].ToString());

            if (Request.QueryString["ref1"] != null)
            {
                int SNS_ID = int.Parse(Request.QueryString["ref1"]);
                EOBSEntities entity = new EOBSEntities();
                var SNV_ID = entity.SINAVSNC.First(x => x.SNS_ID == SNS_ID).SNV_ID;

                SDS_SnvDrsSnc.SelectParameters.Clear();
                SDS_SnvDrsSnc.SelectParameters.Add("SNV_ID", System.Data.DbType.Int32, SNV_ID.ToString());
                SDS_SnvDrsSnc.SelectParameters.Add("KUL_ID", System.Data.DbType.Int32, KUL_ID.ToString());
                Grid2.Rebind();

            }
        }
    }
}