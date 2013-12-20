using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class ODS_OptikFormlar : System.Web.UI.Page
    {
        private int SDT_ID=0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["ref"] != null)
            {
                SDT_ID = int.Parse(Request.QueryString["ref"]);
            }
        }

        protected void GridDamla_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridDamla.SelectedValue != null)
            {
                EOBSEntities entity = new EOBSEntities();
                int id=int.Parse(GridDamla.SelectedValue.ToString());
                SINAVDETAY sinavdetay=entity.SINAVDETAY.First(x=>x.SDT_ID==SDT_ID);
                sinavdetay.OPT_ID = id;
                entity.SaveChanges();

            }

            Response.Redirect("ODS_SinavDetay.aspx");
        }

        protected void EDS_Optik_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            OPTIK opt = (OPTIK)e.Entity;
            if (opt.OPT_AD != null)
                opt.OPT_AD = opt.OPT_AD.ToUpper();
        }

        protected void EDS_Optik_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            OPTIK opt = (OPTIK)e.Entity;
            if (opt.OPT_AD != null)
                opt.OPT_AD = opt.OPT_AD.ToUpper();
        }
    }
}