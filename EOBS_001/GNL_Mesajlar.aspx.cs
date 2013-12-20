using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class GNL_Mesajlar : System.Web.UI.Page
    {
     
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                pGelen.Visible = false;
                pGiden.Visible = false;
                pCvp.Visible = false;
                pGoster.Visible = false;
                pYeniMesaj.Visible = false;
                p2.Visible = false;
                p3.Visible = false;
            }
            if (Request.QueryString["ref"] != null)
            {
                if (Request.QueryString["ref"] == "<")
                {
                    pGelen.Visible = true;
                }
                if (Request.QueryString["ref"] == ">")
                {
                    pGiden.Visible = true;
                }
                if (Request.QueryString["ref"] == "^")
                {
                    pYeniMesaj.Visible = true;
                }
            }
            
            
        }

        protected void Grid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MSG_ID = int.Parse(Grid1.SelectedValue.ToString());
            tMsg_ID.Value = Grid1.SelectedValue.ToString();
            EOBSEntities entity = new EOBSEntities();
            try
            {

                MESAJLAR msg = entity.MESAJLAR.First(x => x.MSJ_ID == MSG_ID);
                msg.MSJ_OKUNDU = true;
                entity.SaveChanges();
                lKimden.Text = msg.MSJ_KIM;
                lKonu.Text = msg.MSJ_KONU;
                lTarih.Text = msg.MSJ_TAR.ToString();
                lMesaj.Text = msg.MSJ_METNI;
                tKonu.Text = "CVP:" + msg.MSJ_KONU;
                pCvp.Visible = true;
                Grid1.Rebind();
            }
            catch
            { }
        }

        protected void btnTanitla_Click(object sender, EventArgs e)
        {
            int MSG_ID = int.Parse(tMsg_ID.Value);
            EOBSEntities entity = new EOBSEntities();
            try
            {
                MESAJLAR msg = entity.MESAJLAR.First(x => x.MSJ_ID == MSG_ID);
                MESAJLAR yeni = new MESAJLAR();
                yeni.MSJ_TAR = DateTime.Now;
                yeni.MSJ_KONU = tKonu.Text.ToUpper();
                yeni.MSJ_METNI = tMesaj.Text;
                yeni.MSJ_KIME_ID = msg.MSJ_KIM_ID;
                yeni.MSJ_KIME = msg.MSJ_KIM;
                yeni.MSJ_KIM_ID = msg.MSJ_KIME_ID;
                yeni.MSJ_KIM = msg.MSJ_KIME;
                yeni.MSJ_OKUNDU = false;
                entity.MESAJLAR.Add(yeni);
                entity.SaveChanges();
                Response.Redirect("GNL_Mesajlar.aspx?ref=<");
            }
            catch
            { }
               
            

        }

        protected void Grid2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MSG_ID = int.Parse(Grid2.SelectedValue.ToString());
            EOBSEntities entity = new EOBSEntities();
            try
            {
                MESAJLAR msg = entity.MESAJLAR.First(x => x.MSJ_ID == MSG_ID);
                lKime1.Text = msg.MSJ_KIME;
                lKonu1.Text = msg.MSJ_KONU;
                lTarih1.Text = msg.MSJ_TAR.ToString();
                lMesaj1.Text = msg.MSJ_METNI;
                pGoster.Visible = true;
            }
            catch
            { }
        }

        protected void btnYeniMsg_Click(object sender, EventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            KULLANICILAR kul = (KULLANICILAR)Session["Kul"];
            if (cKategori.SelectedIndex != -1)
            {
                if (cKategori.SelectedValue == "2")
                {
                    if (cOgrentmen.SelectedIndex == -1)
                    {
                        for (int i = 0; i < cOgrentmen.Items.Count; i++)
                        {
                            if (kul.KUL_ID.ToString() != cOgrentmen.Items[i].Value)
                            {
                                MESAJLAR msg = new MESAJLAR();
                                msg.MSJ_KIME_ID = int.Parse(cOgrentmen.Items[i].Value);
                                msg.MSJ_KIME = cOgrentmen.Items[i].Text;
                                msg.MSJ_METNI = txtMesaj.Text;
                                msg.MSJ_KONU = txtKonu.Text.ToUpper();
                                msg.MSJ_TAR = DateTime.Now;
                                msg.MSJ_KIM = kul.KUL_ADSOYAD;
                                msg.MSJ_KIM_ID = kul.KUL_ID;
                                entity.MESAJLAR.Add(msg);
                            }
                        }
                    }
                    else
                    {
                        MESAJLAR msg = new MESAJLAR();
                        msg.MSJ_KIME_ID = int.Parse(cOgrentmen.SelectedItem.Value);
                        msg.MSJ_KIME = cOgrentmen.SelectedItem.Text;
                        msg.MSJ_METNI = txtMesaj.Text;
                        msg.MSJ_KONU = txtKonu.Text.ToUpper();
                        msg.MSJ_TAR = DateTime.Now;
                        msg.MSJ_KIM = kul.KUL_ADSOYAD;
                        msg.MSJ_KIM_ID = kul.KUL_ID;
                        entity.MESAJLAR.Add(msg);
                    }

                }

                entity.SaveChanges();
                Response.Redirect("GNL_Mesajlar.aspx?ref=>");
            }
        }

        protected void cKategori_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cOgrentmen.SelectedIndex = -1;
            cOgrentmen.Text = "TÜMÜ";

            cb_Sube.SelectedIndex = -1;
            cb_Sube.Text = "TÜMÜ";

            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "TÜMÜ";

            cb_Sinif.SelectedIndex = -1;
            cb_Sinif.Text = "TÜMÜ";

            if (cKategori.SelectedValue == "2")
            {
            
                p2.Visible = true;
                p3.Visible = false;
            }
            if (cKategori.SelectedValue == "3")
            {
                p3.Visible = true;
                p2.Visible = false;
            }
        }

        protected void cb_Sinif_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Sube.SelectedIndex = -1;
            cb_Sube.Text = "TÜMÜ";

            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "TÜMÜ";
        }

        protected void cb_Sube_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cb_Kul.SelectedIndex = -1;
            cb_Kul.Text = "TÜMÜ";
        }
    }
}