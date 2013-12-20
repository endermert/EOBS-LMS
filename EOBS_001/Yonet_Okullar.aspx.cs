using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class Yonet_Okullar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["AktifOkulId"] != null)
                {
                    GridOkullar.SelectedIndexes.Clear();
                    GridOkullar.SelectedIndexes.Add(new int[] { int.Parse(Session["AktifIndex"].ToString())});
                }
            }
            catch
            { 

            }
        }

        protected void GridOkullar_SelectedIndexChanged(object sender, EventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            OKULLAR okul = new OKULLAR();
            try
            {                
                Session["AktifOkulId"] = GridOkullar.SelectedValue.ToString();
                int AktifOkulId = int.Parse(GridOkullar.SelectedValue.ToString());
                okul = entity.OKULLAR.First(x => x.OKL_ID == AktifOkulId);
                Session["AktifOkulAd"] = okul.OKL_ADI;
                Session["OkulTur"] = okul.OTR_KOD;
                if (GridOkullar.SelectedIndexes.Count > 0)
                {
                    Session["AktifIndex"] = GridOkullar.SelectedIndexes[0];
                    
                }

                Response.Redirect("index.aspx");
            }
            catch
            { 

            }
        }
    }
}