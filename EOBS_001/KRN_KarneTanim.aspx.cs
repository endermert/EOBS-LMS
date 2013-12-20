using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class KRN_KarneTanim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EDS_KarneDers_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            KARNEDERS kd = (KARNEDERS)e.Entity;
            if (kd != null)
            {
                EOBSEntities entity = new EOBSEntities();
                try
                {
                    KARNEDERS kd1 = entity.KARNEDERS.First(x=> x.SNF_ID==kd.SNF_ID && x.DRS_ID==kd.DRS_ID);
                    e.Cancel = true;
                }
                catch
                { 

                }
            }
        }

        protected void EDS_KarneDers_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            KARNEDERS kd = (KARNEDERS)e.Entity;
            if (kd != null)
            {
                EOBSEntities entity = new EOBSEntities();
                try
                {
                    KARNEDERS kd1 = entity.KARNEDERS.First(x => x.SNF_ID == kd.SNF_ID && x.DRS_ID == kd.DRS_ID);
                    e.Cancel = true;
                }
                catch
                {

                }
            }
        }
    }
}