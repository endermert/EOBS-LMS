using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
using System.IO;
namespace EOBS_001
{
    public partial class Yonet_Resimler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYukle_Click(object sender, EventArgs e)
        {
            if (rsmFile.HasFile)
            {
                if (rsmFile.PostedFile.ContentType.IndexOf("image")!=-1)
                {
                    if (rsmFile.PostedFile.ContentLength < 5100000)
                    {
                        string filename = Path.GetFileName(rsmFile.FileName);
                        string yol = Server.MapPath("~/RESIMLER/OKUL/") + filename;
                        rsmFile.SaveAs(yol);

                        EOBSEntities entity = new EOBSEntities();
                        RESIMLER resim = new RESIMLER();
                        resim.RSM_AD = rsmAd.Text.ToUpper();
                        resim.RSM_DAD = filename;
                        resim.RSM_YOL = yol;
                        resim.RSM_IMG = rsmFile.FileBytes;
                        resim.RSM_TYPE = rsmFile.PostedFile.ContentType;
                        resim.OKL_ID = int.Parse(Session["AktifOkulId"].ToString());
                        entity.RESIMLER.Add(resim);
                        entity.SaveChanges();
                        EDS_Resimler.DataBind();
                        Grid1.Rebind();
                    }
                }
            }
        }
    }
}