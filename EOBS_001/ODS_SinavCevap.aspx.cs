using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
using Telerik.Web.UI;
namespace EOBS_001
{
    public partial class ODS_SinavCevap : System.Web.UI.Page
    {
        public int SNV_ID = 0;
        private short sorusay = 0;
        int indx = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ref"] != null)
            {
                SNV_ID = int.Parse(Request.QueryString["ref"]);

                EOBSEntities entity = new EOBSEntities();
                SINAVLAR snv = entity.SINAVLAR.First(x => x.SNV_ID == SNV_ID);
                if (snv != null)
                {
                    lblBaslik.Text = snv.SNV_AD;
                    if (DersCombo.Items.Count == 0)
                    {
                        RadComboBoxItem item = new RadComboBoxItem();
                        if (snv.SINAVDETAY.DERSLER != null)
                        {
                            item.Text = snv.SINAVDETAY.DERSLER.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER.DRS_ID.ToString();
                            item.Selected = true;
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER1 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER1.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER1.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER2 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER2.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER2.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER3 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER3.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER3.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER4 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER4.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER4.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER5 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER5.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER5.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER6 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER6.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER6.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER7 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER7.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER7.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER8 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER8.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER8.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER9 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER9.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER9.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER10 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER10.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER10.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER11 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER11.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER11.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER12 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER12.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER12.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER13 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER13.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER13.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        if (snv.SINAVDETAY.DERSLER14 != null)
                        {
                            item = new RadComboBoxItem();
                            item.Text = snv.SINAVDETAY.DERSLER14.DRS_AD;
                            item.Value = snv.SINAVDETAY.DERSLER14.DRS_ID.ToString();
                            DersCombo.Items.Add(item);
                        }
                        


                    }


                    if (DersCombo.SelectedIndex == 0)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS0SS;
                    if (DersCombo.SelectedIndex == 1)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS1SS;
                    if (DersCombo.SelectedIndex == 2)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS2SS;
                    if (DersCombo.SelectedIndex == 3)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS3SS;
                    if (DersCombo.SelectedIndex == 4)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS4SS;
                    if (DersCombo.SelectedIndex == 5)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS5SS;
                    if (DersCombo.SelectedIndex == 6)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS6SS;
                    if (DersCombo.SelectedIndex == 7)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS7SS;
                    if (DersCombo.SelectedIndex == 8)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS8SS;
                    if (DersCombo.SelectedIndex == 9)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS9SS;
                    if (DersCombo.SelectedIndex == 10)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS10SS;
                    if (DersCombo.SelectedIndex == 11)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS11SS;
                    if (DersCombo.SelectedIndex == 12)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS12SS;
                    if (DersCombo.SelectedIndex == 13)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS13SS;
                    if (DersCombo.SelectedIndex == 14)
                        sorusay = (short)snv.SINAVDETAY.SDT_DRS14SS;

                    int DRS_ID=int.Parse(DersCombo.SelectedValue);
                    //string cvpA = "                                                            ";
                    string cvpA = "";
                    string cvpB = cvpA;
                    string cvpC = cvpA;
                    string cvpD = cvpA;
                    CEVAPLAR cvp = null;
                    if (!Page.IsPostBack)
                    try
                    {
                        cvp = entity.CEVAPLAR.First(x => x.SNV_ID == SNV_ID && x.DRS_ID == DRS_ID);
                    }
                    catch
                    {
                        cvp = null;
                    }
                    
                    if (cvp != null)
                    {
                        cvpA = cvp.CVP_KA;
                        cvpB = cvp.CVP_KB;
                        cvpC = cvp.CVP_KC;
                        cvpD = cvp.CVP_KD;
                    }
                        
                        for (int i = 0; i < Table1.Rows.Count; i++)
                        {
                            if (i <= sorusay)
                            {
                                Table1.Rows[i].Visible = true;
                                foreach (Control con in Table1.Rows[i].Cells[1].Controls)
                                {
                                    if (con is TextBox)
                                    {
                                        
                                        if (i <= cvpA.Length)
                                            ((TextBox)con).Text = cvpA.Substring(i - 1, 1);
                                        ((TextBox)con).Attributes.Add("onkeyup", "TxtKontrol(this,'ta" + (i + 1) + "')");
                                    }
                                }
                                if (snv.SNV_KB)
                                {
                                    Table1.Rows[i].Cells[2].Visible = true;
                                    foreach (Control con in Table1.Rows[i].Cells[2].Controls)
                                    {
                                        if (con is TextBox)
                                        {
                                            if (i <= cvpB.Length)
                                                ((TextBox)con).Text = cvpB.Substring(i - 1, 1);
                                            ((TextBox)con).Attributes.Add("onkeyup", "TxtKontrol(this,'tb" + (i + 1) + "')");
                                        }
                                    }
                                }
                                else
                                {
                                    Table1.Rows[i].Cells[2].Visible = false;
                                }

                                if (snv.SNV_KC)
                                {
                                    Table1.Rows[i].Cells[3].Visible = true;
                                    foreach (Control con in Table1.Rows[i].Cells[3].Controls)
                                    {
                                        if (con is TextBox)
                                        {
                                            if (i <= cvpC.Length)
                                                ((TextBox)con).Text = cvpC.Substring(i - 1, 1);
                                            ((TextBox)con).Attributes.Add("onkeyup", "TxtKontrol(this,'tc" + (i + 1) + "')");
                                        }
                                    }
                                }
                                else
                                {
                                    Table1.Rows[i].Cells[3].Visible = false;
                                }

                                if (snv.SNV_KD)
                                {
                                    Table1.Rows[i].Cells[4].Visible = true;
                                    foreach (Control con in Table1.Rows[i].Cells[4].Controls)
                                    {
                                        if (con is TextBox)
                                        {
                                            if (i <= cvpD.Length)
                                                ((TextBox)con).Text = cvpD.Substring(i - 1, 1);
                                            ((TextBox)con).Attributes.Add("onkeyup", "TxtKontrol(this,'td" + (i + 1) + "')");
                                        }
                                    }
                                }
                                else
                                {
                                    Table1.Rows[i].Cells[4].Visible = false;
                                }
                            }
                            else
                            {
                                Table1.Rows[i].Visible = false;
                            }
                        }

                    

                }

            }
            


        }

        protected void ta_TextChanged(object sender, EventArgs e)
        {
            TextBox ta = (TextBox)sender;
            ta.Text = ta.Text.ToUpper();
            string t=ta.Text;
            if (t != "A" && t != "B" && t != "C" && t != "D" && t != "E" && t != "X")
            {
                ta.Text = "";
            }
        }

        protected void DersCombo_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            EOBSEntities entity = new EOBSEntities();
            int DRS_ID = int.Parse(DersCombo.SelectedValue);
            string cvpA = "                                                            ";
            //string cvpA = "";
            string cvpB = cvpA;
            string cvpC = cvpA;
            string cvpD = cvpA;
            CEVAPLAR cvp = null;
            
            try
                {
                    cvp = entity.CEVAPLAR.First(x => x.SNV_ID == SNV_ID && x.DRS_ID == DRS_ID);
                }
                catch
                {
                    cvp = null;
                }

            if (cvp != null)
            {
                cvpA = cvp.CVP_KA;
                cvpB = cvp.CVP_KB;
                cvpC = cvp.CVP_KC;
                cvpD = cvp.CVP_KD;
            }

            for (int i = 1; i < Table1.Rows.Count; i++)
            {
                foreach (Control con in Table1.Rows[i].Cells[1].Controls)
                {
                    if (con is TextBox)
                    {
                        if (i <= cvpA.Length)
                            ((TextBox)con).Text = cvpA.Substring(i - 1, 1);
                        //((TextBox)con).Text = "";
                        //((TextBox)con).Attributes.Add("onkeyup", "TxtKontrol(this,'ta" + (i + 1) + "')");
                    }
                }

                foreach (Control con in Table1.Rows[i].Cells[2].Controls)
                {
                    if (con is TextBox)
                    {
                        if (i <= cvpB.Length)
                            ((TextBox)con).Text = cvpB.Substring(i - 1, 1);
                        //((TextBox)con).Text = "";
                        //((TextBox)con).Attributes.Add("onkeyup", "TxtKontrol(this,'tb" + (i + 1) + "')");
                    }
                }


                foreach (Control con in Table1.Rows[i].Cells[3].Controls)
                {
                    if (con is TextBox)
                    {
                        if (i <= cvpC.Length)
                            ((TextBox)con).Text = cvpC.Substring(i - 1, 1);
                        else
                            ((TextBox)con).Text = "X";
                        //((TextBox)con).Text = "";
                        //((TextBox)con).Attributes.Add("onkeyup", "TxtKontrol(this,'tc" + (i + 1) + "')");
                    }
                }

                foreach (Control con in Table1.Rows[i].Cells[4].Controls)
                {
                    if (con is TextBox)
                    {
                        if (i <= cvpD.Length)
                            ((TextBox)con).Text = cvpD.Substring(i - 1, 1);
                        //((TextBox)con).Text = "";
                        //  ((TextBox)con).Attributes.Add("onkeyup", "TxtKontrol(this,'td" + (i + 1) + "')");
                    }
                }
            }

        }

        protected void btn_Kaydet_Click(object sender, EventArgs e)
        {
            String cvpA = "";
            String cvpB = "";
            String cvpC = "";
            String cvpD = "";

            for (int i = 1; i <= sorusay; i++)
            {
                foreach (Control con in Table1.Rows[i].Cells[1].Controls)
                {
                    if (con is TextBox)
                    {
                        if (((TextBox)con).Text == "")
                            cvpA = cvpA + " ";
                        else
                            cvpA = cvpA + ((TextBox)con).Text;
                        
                    }
                }

                foreach (Control con in Table1.Rows[i].Cells[2].Controls)
                {
                    if (con is TextBox)
                    {
                        if (((TextBox)con).Text == "")
                            cvpB = cvpB + " ";
                        else
                            cvpB = cvpB + ((TextBox)con).Text;

                    }
                }

                foreach (Control con in Table1.Rows[i].Cells[3].Controls)
                {
                    if (con is TextBox)
                    {
                        if (((TextBox)con).Text == "")
                            cvpC = cvpC + " ";
                        else
                            cvpC = cvpC + ((TextBox)con).Text;

                    }
                }

                foreach (Control con in Table1.Rows[i].Cells[4].Controls)
                {
                    if (con is TextBox)
                    {
                        if (((TextBox)con).Text == "")
                            cvpD= cvpD + " ";
                        else
                            cvpD = cvpD + ((TextBox)con).Text;

                    }
                }
            }

            int DRS_ID = int.Parse(DersCombo.SelectedValue);

            EOBSEntities entity = new EOBSEntities();
            try
            {
                CEVAPLAR cvp = entity.CEVAPLAR.First(x => x.SNV_ID == SNV_ID && x.DRS_ID == DRS_ID);
                cvp.SNV_ID = SNV_ID;
                cvp.DRS_ID = DRS_ID;
                cvp.CVP_KA = cvpA;
                cvp.CVP_KB = cvpB;
                cvp.CVP_KC = cvpC;
                cvp.CVP_KD = cvpD;
            }
            catch
            {
                CEVAPLAR cvp = new CEVAPLAR();
                cvp.SNV_ID = SNV_ID;
                cvp.DRS_ID = DRS_ID;
                cvp.CVP_KA = cvpA;
                cvp.CVP_KB = cvpB;
                cvp.CVP_KC = cvpC;
                cvp.CVP_KD = cvpD;
                entity.CEVAPLAR.Add(cvp);
            }
            
            entity.SaveChanges();


        }
    }
}