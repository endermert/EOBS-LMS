using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class RDS_Randevum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            EDS_RDSDersler.WhereParameters.Clear();
            EDS_RDSDersler.WhereParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
            EDS_RDSDersler.InsertParameters.Clear();
            EDS_RDSDersler.InsertParameters.Add("KUL_ID", System.Data.DbType.Int32, Session["KulId"].ToString());
        }

        protected void EDS_RDSDersler_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            RDSDERSLER rds = (RDSDERSLER)e.Entity;
            if (rds.RDS_KONT != null)
                rds.RDS_KONTBOS = rds.RDS_KONT;
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
                    rdsdersler = entity.RDSDERSLER.First(x => x.RDS_ID == RDS_ID);
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

        protected void Grid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RDS_ID = int.Parse(Grid1.SelectedValue.ToString());
            SDS_RDSListe.SelectParameters.Clear();
            SDS_RDSListe.SelectParameters.Add("RDS_ID",System.Data.DbType.Int32,RDS_ID.ToString());
            Grid2.Rebind();
        }

        protected void Grid2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RDS_ID = int.Parse(Grid1.SelectedValue.ToString());
            int KUL_ID = int.Parse(Grid2.SelectedValue.ToString());

            EOBSEntities entity = new EOBSEntities();
            RDSLISTE rdsliste;
            try
            {
                rdsliste = entity.RDSLISTE.First(x => x.RDS_ID == RDS_ID && x.KUL_ID == KUL_ID);
                entity.RDSLISTE.Remove(rdsliste);
                entity.SaveChanges();
            }
            catch
            { }

            Grid2.Rebind();
            Grid1.Rebind();
        }
    }
}