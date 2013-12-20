using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class RDS_Randevum1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Grid1_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandArgument.ToString() == "RDS")
            {
                e.Canceled = true;
                int RDS_ID = int.Parse(e.Item.Cells[2].Text);
                int KUL_ID = int.Parse(Session["KulId"].ToString());
                EOBSEntities entity = new EOBSEntities();
                RDSLISTE rdsliste;
                RDSDERSLER rdsdersler;
                try
                {
                    rdsdersler = entity.RDSDERSLER.First(x => x.RDS_ID == RDS_ID);
                    if (rdsdersler.RDS_KONTBOS > 0)
                    {

                        Boolean ekle = true;
                        try
                        {
                            rdsliste = entity.RDSLISTE.First(x => x.RDS_ID == RDS_ID && x.KUL_ID == KUL_ID);
                            ekle = false;
                        }
                        catch
                        {
                            rdsliste = new RDSLISTE();
                        }
                        rdsliste.RDS_ID = RDS_ID;
                        rdsliste.KUL_ID = KUL_ID;
                        if (ekle)
                        {
                            entity.RDSLISTE.Add(rdsliste);
                            rdsdersler.RDS_KONTBOS--;
                        }
                        entity.SaveChanges();
                    }
                }
                catch
                { 

                }

                SDS_RDSListe.DataBind();
                Grid2.Rebind();
                Grid1.Rebind();

            }
        }

        protected void Grid2_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandArgument.ToString() == "RDS")
            {
                int RDL_ID = int.Parse(e.Item.Cells[2].Text);
                int? RDS_ID;
                EOBSEntities entity = new EOBSEntities();
                RDSLISTE rdsliste;
                RDSDERSLER rdsdersler;
                try
                {
                    rdsliste = entity.RDSLISTE.First(x => x.RDL_ID == RDL_ID);
                    RDS_ID = rdsliste.RDS_ID;
                    entity.RDSLISTE.Remove(rdsliste);
                    entity.SaveChanges();
                    rdsdersler = entity.RDSDERSLER.First(x=> x.RDS_ID==RDS_ID);
                    rdsdersler.RDS_KONTBOS++;
                    entity.SaveChanges();

                }
                catch
                {
                }
            }

            Grid2.Rebind();
            Grid1.Rebind();

        }
    }
}