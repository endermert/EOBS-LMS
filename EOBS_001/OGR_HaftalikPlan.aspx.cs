using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class OGR_HaftalikPlan : System.Web.UI.Page
    {
        public AOPLANLAR Plan = new AOPLANLAR();
        protected void Page_Load(object sender, EventArgs e)
        {
            KULLANICILAR kul = (KULLANICILAR)Session["Kul"];

            if (kul != null)
                if (kul.SUBELER != null)
                    if (kul.OKL_ID != null)
                    {
                        EOBSEntities entity = new EOBSEntities();
                        int OKL_ID = (int)kul.OKL_ID;
                        int HFT_ID = int.Parse(Session["AktifHaftaId"].ToString());
                        Plan = entity.AOPLANLAR.First(x => x.OKL_ID == OKL_ID && x.HFT_ID==HFT_ID);
                    }
        }
    }
}