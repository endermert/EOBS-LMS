using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class RDS_Randevular : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EDS_RDSDersler_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {

        }

        protected void EDS_RDSDersler_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            RDSDERSLER rds = (RDSDERSLER)e.Entity;
            if (rds.RDS_KONT != null)
                rds.RDS_KONTBOS = rds.RDS_KONT;
        }
    }
}