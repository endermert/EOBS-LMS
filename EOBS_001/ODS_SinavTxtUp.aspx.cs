using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
using EOBS_001.Kontrol;
namespace EOBS_001
{
    public partial class ODS_SinavTxtUp : System.Web.UI.Page
    {
        int SNV_ID=0;
        private DataTable table;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ref"] != null)
            {
                SNV_ID = int.Parse(Request.QueryString["ref"]);
                //if (Page.IsPostBack)
                //{
                //    if (Session["DataTable"] != null)
                //    {
                //        Panel1.Visible = true;
                //        GridDamla.DataSource = (DataTable)Session["DataTable"];
                //        GridDamla.Rebind();
                        
                //    }
                //}
                //else
                //{
                //    Session.Remove("DataTable");
                //    Panel1.Visible = false;
                //}
                TableDeg.Visible = false;
                Panel1.Visible = false;
                if (Session["DataTable"] != null)
                {
                    Panel1.Visible = true;
                    TableDeg.Visible = true;
                    GridDamla.DataSource = (DataTable)Session["DataTable"];
                    GridDamla.Rebind();

                }
                
            }
        }

        

        protected void btn_upload_Click(object sender, EventArgs e)
        {
            if (txtup.HasFile)
            {
                if (txtup.PostedFile.ContentType == "text/plain")
                {
                    if (txtup.PostedFile.ContentLength < 1002400)
                    {
                        string filename = Path.GetFileName(txtup.FileName);
                        string yol = Server.MapPath("~/TXTUP/") + filename;
                        txtup.SaveAs(yol);
                        lbl_msg.Text = "Dosya yüklendi..";

                        EOBSEntities entity = new EOBSEntities();
                        SINAVLAR snv = entity.SINAVLAR.First(x => x.SNV_ID == SNV_ID);
                        if (snv != null)
                        {
                            table = new DataTable();
                            table.Columns.Add("SIRA", typeof(string));
                            table.Columns.Add("KAYIT", typeof(string));
                            table.Columns.Add("OKUL KODU", typeof(string));
                            table.Columns.Add("NUMARA", typeof(string));
                            table.Columns.Add("TC KiMLiK NO", typeof(string));
                            table.Columns.Add("K", typeof(string));
                            
                          

                            //table.Columns.Add("1. Ders Cevap", typeof(string));
                            //table.Columns.Add("2. Ders Cevap", typeof(string));
                            //table.Columns.Add("3. Ders Cevap", typeof(string));
                            //table.Columns.Add("4. Ders Cevap", typeof(string));
                            short sycd = 0;
                            if (snv.SINAVDETAY.DERSLER != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER.DRS_AD, typeof(string));
                                
                            }
                            if (snv.SINAVDETAY.DERSLER1 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER1.DRS_AD, typeof(string));
                               
                            }
                            if (snv.SINAVDETAY.DERSLER2 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER2.DRS_AD, typeof(string));
                                
                            }
                            if (snv.SINAVDETAY.DERSLER3 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER3.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER4 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER4.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER5 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER5.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER6 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER6.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER7 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER7.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER8 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER8.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER9 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER9.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER10 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER10.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER11 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER11.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER12 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER12.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER13 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER13.DRS_AD, typeof(string));
                            }
                            if (snv.SINAVDETAY.DERSLER14 != null)
                            {
                                sycd++;
                                table.Columns.Add(snv.SINAVDETAY.DERSLER14.DRS_AD, typeof(string));
                            }
                            StreamReader reader = new StreamReader(yol);
                            
                            int syc = 0;
                            while (!reader.EndOfStream)
                            {
                                syc++;
                                string satir = reader.ReadLine();
                                if (satir == "") break;
                                string ogrNo = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_NO_BAS-1,(short)snv.SINAVDETAY.OPTIK.OPT_NO_UZN);
                                string oklKod = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_OK_BAS - 1, (short)snv.SINAVDETAY.OPTIK.OPT_OK_UZN);
                                string tcNo= satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_TC_BAS-1,(short)snv.SINAVDETAY.OPTIK.OPT_TC_UZN);
                                string kitapcik = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_KT_BAS - 1,1);
                                string cvpD1 = "";
                                string cvpD2 = "";
                                string cvpD3 = "";
                                string cvpD4 = "";
                                string cvpD5 = "";
                                string cvpD6 = "";
                                string cvpD7 = "";
                                string cvpD8 = "";
                                string cvpD9 = "";
                                string cvpD10 = "";
                                string cvpD11 = "";
                                string cvpD12 = "";
                                string cvpD13 = "";
                                string cvpD14 = "";
                                string cvpD15 = "";
                                if (snv.SINAVDETAY.DERSLER != null)
                                    cvpD1 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D0_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS0SS);
                                if (snv.SINAVDETAY.DERSLER1!=null)
                                    cvpD2 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D1_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS1SS);
                                if (snv.SINAVDETAY.DERSLER2!=null)
                                    cvpD3 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D2_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS2SS);
                                if (snv.SINAVDETAY.DERSLER3!=null)
                                    cvpD4 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D3_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS3SS);
                                if (snv.SINAVDETAY.DERSLER4 != null)
                                    cvpD5 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D4_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS4SS);
                                if (snv.SINAVDETAY.DERSLER5 != null)
                                    cvpD6 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D5_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS5SS);
                                if (snv.SINAVDETAY.DERSLER6 != null)
                                    cvpD7 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D6_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS6SS);
                                if (snv.SINAVDETAY.DERSLER7 != null)
                                    cvpD8 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D7_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS7SS);
                                if (snv.SINAVDETAY.DERSLER8 != null)
                                    cvpD9 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D8_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS8SS);
                                if (snv.SINAVDETAY.DERSLER9 != null)
                                    cvpD10 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D9_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS9SS);
                                if (snv.SINAVDETAY.DERSLER10 != null)
                                    cvpD11 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D10_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS10SS);
                                if (snv.SINAVDETAY.DERSLER11 != null)
                                    cvpD12 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D11_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS11SS);
                                if (snv.SINAVDETAY.DERSLER12 != null)
                                    cvpD13 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D12_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS12SS);
                                if (snv.SINAVDETAY.DERSLER13 != null)
                                    cvpD14 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D13_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS13SS);
                                if (snv.SINAVDETAY.DERSLER14 != null)
                                    cvpD15 = satir.Substring((short)snv.SINAVDETAY.OPTIK.OPT_D14_BAS - 1, (short)snv.SINAVDETAY.SDT_DRS14SS);

                                switch (sycd)
                                { 
                                    case 1:
                                        table.Rows.Add(syc.ToString(),"H", oklKod, ogrNo, tcNo, kitapcik, cvpD1);
                                        break;
                                    case 2:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2);
                                        break;
                                    case 3:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3);
                                        break;
                                    case 4:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4);
                                        break;
                                    case 5:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5);
                                        break;
                                    case 6:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6);
                                        break;
                                    case 7:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6, cvpD7);
                                        break;
                                    case 8:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6, cvpD7, cvpD8);
                                        break;
                                    case 9:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6, cvpD7, cvpD8, cvpD9);
                                        break;
                                    case 10:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6, cvpD7, cvpD8, cvpD9, cvpD10);
                                        break;
                                    case 11:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6, cvpD7, cvpD8, cvpD9, cvpD10, cvpD11);
                                        break;
                                    case 12:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6, cvpD7, cvpD8, cvpD9, cvpD10, cvpD11, cvpD12);
                                        break;
                                    case 13:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6, cvpD7, cvpD8, cvpD9, cvpD10, cvpD11, cvpD12, cvpD13);
                                        break;
                                    case 14:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6, cvpD7, cvpD8, cvpD9, cvpD10, cvpD11, cvpD12, cvpD13, cvpD14);
                                        break;
                                    case 15:
                                        table.Rows.Add(syc.ToString(), "H", oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4, cvpD5, cvpD6, cvpD7, cvpD8, cvpD9, cvpD10, cvpD11, cvpD12, cvpD13, cvpD14, cvpD15);
                                        break;
                                }
                                //if (snv.SINAVDETAY.DERSLER != null && snv.SINAVDETAY.DERSLER1 != null && snv.SINAVDETAY.DERSLER2 != null && snv.SINAVDETAY.DERSLER3 != null && snv.SINAVDETAY.DERSLER4 != null)
                                //    table.Rows.Add(syc.ToString(), oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3, cvpD4,cvpD5);
                                //else
                                //    if (snv.SINAVDETAY.DERSLER != null && snv.SINAVDETAY.DERSLER1 != null && snv.SINAVDETAY.DERSLER2 != null && snv.SINAVDETAY.DERSLER3 != null)
                                //        table.Rows.Add(syc.ToString(), oklKod, ogrNo, tcNo,kitapcik, cvpD1, cvpD2, cvpD3, cvpD4);
                                //    else 
                                //        if (snv.SINAVDETAY.DERSLER != null && snv.SINAVDETAY.DERSLER1 != null && snv.SINAVDETAY.DERSLER2 != null)
                                //            table.Rows.Add(syc.ToString(), oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2, cvpD3);
                                //        else 
                                //            if (snv.SINAVDETAY.DERSLER != null && snv.SINAVDETAY.DERSLER1 != null)
                                //                table.Rows.Add(syc.ToString(), oklKod, ogrNo, tcNo, kitapcik, cvpD1, cvpD2);
                                //            else
                                //                if (snv.SINAVDETAY.DERSLER != null)
                                //                    table.Rows.Add(syc.ToString(), oklKod, ogrNo, tcNo, kitapcik, cvpD1);
                            }
                            reader.Close();
                            GridDamla.PageSize = syc;
                            GridDamla.DataSource = table;
                            Session["DataTable"] = table;
                            TableDeg.Visible = true;

                            Panel1.Visible = true;
                            GridDamla.Rebind();
                        }

                        
                    }
                    else
                    {
                        lbl_msg.Text = "Dosyanız çok büyük.";
                    }
                }
                else
                {
                    lbl_msg.Text = "Dosya tipi uyumsuz.";
                }

            }
            else
            {
                lbl_msg.Text = "Lütfen bir dosya seçin. ";
            }
        }

        private List<List<SORUANALIZ>> SoruAnalizList=new List<List<SORUANALIZ>>();
        private List<CEVAPLAR> CvpList = new List<CEVAPLAR>();
        private void Hesapla(EOBSEntities entity, SINAVLAR snv, short drs_ss, int SNV_ID, int DRS_ID, String Kitapcik, String cvpD0, int KUL_ID, Decimal KS, String DersAdi)
        {

                List<SORUANALIZ> SoruAnaliz = null;
                int saSyc = 0;
                for (int i = 0; i < SoruAnalizList.Count; i++)
                {
                    if (SoruAnalizList[i][0].DRS_ID == DRS_ID)
                    {
                        SoruAnaliz = SoruAnalizList[i];
                        saSyc = i;
                        break;
                    }
                }
                if (SoruAnaliz == null)
                {
                    SoruAnaliz = new List<SORUANALIZ>();
                    for (int j = 0; j < drs_ss; j++)
                    {
                        SORUANALIZ sa = new SORUANALIZ();
                        sa.DRS_ID = DRS_ID;
                        sa.SNV_ID = SNV_ID;
                        sa.SOR_NO = (short)(j + 1);
                        sa.SOR_CVPA = 0;
                        sa.SOR_CVPB = 0;
                        sa.SOR_CVPC = 0;
                        sa.SOR_CVPD = 0;
                        sa.SOR_CVPE = 0;
                        SoruAnaliz.Add(sa);
                    }
                    SoruAnalizList.Add(SoruAnaliz);
                    saSyc = SoruAnalizList.Count - 1;
                }

                #region DERSLER

                short drs_ds = 0;
                short drs_ys = 0;
                short drs_bs = 0;
                //short drs_ss = (short)snv.SINAVDETAY.SDT_DRS0SS;
                short drs_ss1 = drs_ss;
                CEVAPLAR cvp = null;
                for (int i = 0; i < CvpList.Count; i++)
                {
                    if (CvpList[i].DRS_ID == DRS_ID)
                    {
                        cvp = CvpList[i];
                        break;
                    }
                }
                if (cvp == null)
                    try
                    {
                        cvp = snv.CEVAPLAR.First(x => x.SNV_ID == SNV_ID && x.DRS_ID == DRS_ID);
                        CvpList.Add(cvp);
                    }
                    catch
                    {

                    }
                String cvpRef = "";
                if (cvp != null)
                {
                    if (Kitapcik == "A")
                        cvpRef = cvp.CVP_KA;
                    if (Kitapcik == "B")
                        cvpRef = cvp.CVP_KB;
                    if (Kitapcik == "C")
                        cvpRef = cvp.CVP_KC;
                    if (Kitapcik == "D")
                        cvpRef = cvp.CVP_KD;
                }
                //String cvpD0 = dt.Rows[i][5].ToString();
                String cvpAE = "";
                for (int s = 0; s < drs_ss1; s++)
                {
                    if (cvpRef.Length > s)
                        if (cvpRef[s] == 'X')
                        {
                            drs_ss--;
                        }
                        else
                        {
                            if (cvpD0[s] == cvpRef[s] || cvpRef[s] == 'O')
                                drs_ds++;
                            else
                                if (cvpD0[s] != cvpRef[s] && cvpD0[s] != ' ')
                                    drs_ys++;
                                else
                                    if (cvpD0[s] == ' ')
                                        drs_bs++;

                            if (cvpD0[s] == cvpRef[s] || cvpRef[s] == 'O')
                                cvpAE = cvpAE + "+";
                            else
                                if (cvpD0[s] != cvpRef[s] && cvpD0[s] != ' ')
                                    cvpAE = cvpAE + "-";
                                else
                                    if (cvpD0[s] == ' ')
                                        cvpAE = cvpAE + " ";

                            SoruAnaliz[s].SOR_NO = (short)(s + 1);
                            SoruAnaliz[s].SOR_DCVP = cvpRef[s].ToString();

                            if (cvpD0[s] == 'A')
                                SoruAnaliz[s].SOR_CVPA++;
                            if (cvpD0[s] == 'B')
                                SoruAnaliz[s].SOR_CVPB++;
                            if (cvpD0[s] == 'C')
                                SoruAnaliz[s].SOR_CVPC++;
                            if (cvpD0[s] == 'D')
                                SoruAnaliz[s].SOR_CVPD++;
                            if (cvpD0[s] == 'E')
                                SoruAnaliz[s].SOR_CVPE++;
                            if (cvpD0[s] == ' ')
                                SoruAnaliz[s].SOR_BOS++;



                        }
                    else
                        drs_ss--;

                }
                SoruAnalizList[saSyc] = SoruAnaliz;

                DRSSNVSNC drssnc;
                Boolean ekle = true;
                try
                {
                    drssnc = entity.DRSSNVSNC.First(x => x.SNV_ID == SNV_ID && x.DRS_ID == DRS_ID && x.KUL_ID == KUL_ID);
                    ekle = false;
                }
                catch
                {
                    drssnc = new DRSSNVSNC();
                }

                drssnc.DRS_ID = DRS_ID;
                drssnc.SNV_ID = SNV_ID;
                drssnc.KUL_ID = KUL_ID;
                drssnc.DSN_SS = drs_ss;
                drssnc.DSN_DS = drs_ds;
                drssnc.DSN_YS = drs_ys;
                drssnc.DSN_BS = drs_bs;
                drssnc.DSN_KTPCK = Kitapcik;
                drssnc.DSN_CVPANH = cvpRef;
                drssnc.DSN_CVPKUL = cvpD0;
                drssnc.DSN_CVPAE = cvpAE;
                Double neti;
                if (snv.SNV_KACY1D == null || snv.SNV_KACY1D == 0)
                    neti = (Double)drs_ds;
                else
                    neti = ((Double)drs_ds - ((Double)drs_ys / (Double)snv.SNV_KACY1D));
                //Double neti = ((Double)drs_ds - ((Double)drs_ys / (Double)snv.SNV_KACY1D));
                //if (neti < 0.00)
                //    neti = 0.00;
                drssnc.DSN_NS = (Decimal)neti;
                drssnc.DSN_PUAN = drssnc.DSN_NS * KS;

                switch (DersAdi)
                {
                    case "YGS TÜRKÇE":
                        drssnc.DSN_YGS1 = drssnc.DSN_NS * 2;
                        drssnc.DSN_YGS2 = drssnc.DSN_NS * 2;
                        drssnc.DSN_YGS3 = drssnc.DSN_NS * 4;
                        drssnc.DSN_YGS4 = drssnc.DSN_NS * 3;
                        drssnc.DSN_YGS5 = drssnc.DSN_NS * Decimal.Parse("3,7");
                        drssnc.DSN_YGS6 = drssnc.DSN_NS * Decimal.Parse("3,3");
                        break;
                    case "YGS MATEMATİK":
                        drssnc.DSN_YGS1 = drssnc.DSN_NS * 4;
                        drssnc.DSN_YGS2 = drssnc.DSN_NS * 3;
                        drssnc.DSN_YGS3 = drssnc.DSN_NS * 2;
                        drssnc.DSN_YGS4 = drssnc.DSN_NS * 2;
                        drssnc.DSN_YGS5 = drssnc.DSN_NS * Decimal.Parse("3,3");
                        drssnc.DSN_YGS6 = drssnc.DSN_NS * Decimal.Parse("3,7");
                        break;
                    case "YGS SOSYAL":
                        drssnc.DSN_YGS1 = drssnc.DSN_NS * 1;
                        drssnc.DSN_YGS2 = drssnc.DSN_NS * 1;
                        drssnc.DSN_YGS3 = drssnc.DSN_NS * 3;
                        drssnc.DSN_YGS4 = drssnc.DSN_NS * 4;
                        drssnc.DSN_YGS5 = drssnc.DSN_NS * 2;
                        drssnc.DSN_YGS6 = drssnc.DSN_NS * 1;
                        break;
                    case "YGS FEN":
                        drssnc.DSN_YGS1 = drssnc.DSN_NS * 3;
                        drssnc.DSN_YGS2 = drssnc.DSN_NS * 4;
                        drssnc.DSN_YGS3 = drssnc.DSN_NS * 1;
                        drssnc.DSN_YGS4 = drssnc.DSN_NS * 1;
                        drssnc.DSN_YGS5 = drssnc.DSN_NS * 1;
                        drssnc.DSN_YGS6 = drssnc.DSN_NS * 2;
                        break;
                    default:
                        drssnc.DSN_YGS1 = 0;
                        drssnc.DSN_YGS2 = 0;
                        drssnc.DSN_YGS3 = 0;
                        drssnc.DSN_YGS4 = 0;
                        drssnc.DSN_YGS5 = 0;
                        drssnc.DSN_YGS6 = 0;
                        break;
                }


                switch (DersAdi)
                {
                    case "YGS TÜRKÇE"://YGS Türkçe

                        drssnc.DSN_MF1 = drssnc.DSN_NS * ((400 * 11) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF2 = drssnc.DSN_NS * ((400 * 11) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF3 = drssnc.DSN_NS * ((400 * 11) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF4 = drssnc.DSN_NS * ((400 * 11) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM1 = drssnc.DSN_NS * ((400 * 14) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM2 = drssnc.DSN_NS * ((400 * 14) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM3 = drssnc.DSN_NS * ((400 * 15) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS1 = drssnc.DSN_NS * ((400 * 13) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS2 = drssnc.DSN_NS * ((400 * 18) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL1 = drssnc.DSN_NS * ((400 * 15) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL2 = drssnc.DSN_NS * ((400 * 25) / 100) / drssnc.DSN_SS;
                        break;
                    case "YGS MATEMATİK"://YGS Matematik
                        drssnc.DSN_MF1 = drssnc.DSN_NS * ((400 * 16) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF2 = drssnc.DSN_NS * ((400 * 11) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF3 = drssnc.DSN_NS * ((400 * 11) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF4 = drssnc.DSN_NS * ((400 * 14) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM1 = drssnc.DSN_NS * ((400 * 16) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM2 = drssnc.DSN_NS * ((400 * 14) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM3 = drssnc.DSN_NS * ((400 * 10) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS1 = drssnc.DSN_NS * ((400 * 10) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS2 = drssnc.DSN_NS * ((400 * 6) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL1 = drssnc.DSN_NS * ((400 * 6) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL2 = drssnc.DSN_NS * ((400 * 7) / 100) / drssnc.DSN_SS;
                        break;
                    case "YGS SOSYAL"://YGS Sosyal
                        drssnc.DSN_MF1 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF2 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF3 = drssnc.DSN_NS * ((400 * 7) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF4 = drssnc.DSN_NS * ((400 * 6) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM1 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM2 = drssnc.DSN_NS * ((400 * 7) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM3 = drssnc.DSN_NS * ((400 * 10) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS1 = drssnc.DSN_NS * ((400 * 12) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS2 = drssnc.DSN_NS * ((400 * 11) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL1 = drssnc.DSN_NS * ((400 * 9) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL2 = drssnc.DSN_NS * ((400 * 13) / 100) / drssnc.DSN_SS;
                        break;
                    case "YGS FEN"://YGS Fen
                        drssnc.DSN_MF1 = drssnc.DSN_NS * ((400 * 8) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF2 = drssnc.DSN_NS * ((400 * 13) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF3 = drssnc.DSN_NS * ((400 * 11) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF4 = drssnc.DSN_NS * ((400 * 9) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM1 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM2 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM3 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS1 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS2 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL1 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL2 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        break;
                    case "LYS MATEMATİK"://LYS Matematik  
                        drssnc.DSN_MF1 = drssnc.DSN_NS * ((400 * 26) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF2 = drssnc.DSN_NS * ((400 * 16) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF3 = drssnc.DSN_NS * ((400 * 13) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF4 = drssnc.DSN_NS * ((400 * 22) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM1 = drssnc.DSN_NS * ((400 * 25) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM2 = drssnc.DSN_NS * ((400 * 22) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM3 = drssnc.DSN_NS * ((400 * 18) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS1 = 0;
                        drssnc.DSN_TS2 = 0;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS GEOMETRİ"://LYS Geometri
                        drssnc.DSN_MF1 = drssnc.DSN_NS * ((400 * 13) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF2 = drssnc.DSN_NS * ((400 * 7) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF3 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF4 = drssnc.DSN_NS * ((400 * 11) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM1 = drssnc.DSN_NS * ((400 * 10) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM2 = drssnc.DSN_NS * ((400 * 8) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM3 = drssnc.DSN_NS * ((400 * 7) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS1 = 0;
                        drssnc.DSN_TS2 = 0;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS FİZİK"://LYS Fizik
                        drssnc.DSN_MF1 = drssnc.DSN_NS * ((400 * 10) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF2 = drssnc.DSN_NS * ((400 * 13) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF3 = drssnc.DSN_NS * ((400 * 13) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF4 = drssnc.DSN_NS * ((400 * 13) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM1 = 0;
                        drssnc.DSN_TM2 = 0;
                        drssnc.DSN_TM3 = 0;
                        drssnc.DSN_TS1 = 0;
                        drssnc.DSN_TS2 = 0;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS KİMYA"://LYS Kimya
                        drssnc.DSN_MF1 = drssnc.DSN_NS * ((400 * 6) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF2 = drssnc.DSN_NS * ((400 * 12) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF3 = drssnc.DSN_NS * ((400 * 14) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF4 = drssnc.DSN_NS * ((400 * 9) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM1 = 0;
                        drssnc.DSN_TM2 = 0;
                        drssnc.DSN_TM3 = 0;
                        drssnc.DSN_TS1 = 0;
                        drssnc.DSN_TS2 = 0;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS BİYOLOJİ"://LYS Biyoloji
                        drssnc.DSN_MF1 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF2 = drssnc.DSN_NS * ((400 * 12) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF3 = drssnc.DSN_NS * ((400 * 15) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_MF4 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM1 = 0;
                        drssnc.DSN_TM2 = 0;
                        drssnc.DSN_TM3 = 0;
                        drssnc.DSN_TS1 = 0;
                        drssnc.DSN_TS2 = 0;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS TÜRK DİLİ VE E."://LYS Türk Dili ve E.
                        drssnc.DSN_MF1 = 0;
                        drssnc.DSN_MF2 = 0;
                        drssnc.DSN_MF3 = 0;
                        drssnc.DSN_MF4 = 0;
                        drssnc.DSN_TM1 = drssnc.DSN_NS * ((400 * 18) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM2 = drssnc.DSN_NS * ((400 * 22) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM3 = drssnc.DSN_NS * ((400 * 25) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS1 = drssnc.DSN_NS * ((400 * 15) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS2 = drssnc.DSN_NS * ((400 * 25) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS COĞRAFYA-1"://LYS Coğrafya-1
                        drssnc.DSN_MF1 = 0;
                        drssnc.DSN_MF2 = 0;
                        drssnc.DSN_MF3 = 0;
                        drssnc.DSN_MF4 = 0;
                        drssnc.DSN_TM1 = drssnc.DSN_NS * ((400 * 7) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM2 = drssnc.DSN_NS * ((400 * 8) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TM3 = drssnc.DSN_NS * ((400 * 10) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS1 = drssnc.DSN_NS * ((400 * 8) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS2 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS TARİH"://LYS Tarih
                        drssnc.DSN_MF1 = 0;
                        drssnc.DSN_MF2 = 0;
                        drssnc.DSN_MF3 = 0;
                        drssnc.DSN_MF4 = 0;
                        drssnc.DSN_TM1 = 0;
                        drssnc.DSN_TM2 = 0;
                        drssnc.DSN_TM3 = 0;
                        drssnc.DSN_TS1 = drssnc.DSN_NS * ((400 * 15) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS2 = drssnc.DSN_NS * ((400 * 15) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS COĞRAFYA-2"://LYS Coğrafya-2
                        drssnc.DSN_MF1 = 0;
                        drssnc.DSN_MF2 = 0;
                        drssnc.DSN_MF3 = 0;
                        drssnc.DSN_MF4 = 0;
                        drssnc.DSN_TM1 = 0;
                        drssnc.DSN_TM2 = 0;
                        drssnc.DSN_TM3 = 0;
                        drssnc.DSN_TS1 = drssnc.DSN_NS * ((400 * 7) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS2 = drssnc.DSN_NS * ((400 * 5) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS FELSEFE"://LYS Felsefe
                        drssnc.DSN_MF1 = 0;
                        drssnc.DSN_MF2 = 0;
                        drssnc.DSN_MF3 = 0;
                        drssnc.DSN_MF4 = 0;
                        drssnc.DSN_TM1 = 0;
                        drssnc.DSN_TM2 = 0;
                        drssnc.DSN_TM3 = 0;
                        drssnc.DSN_TS1 = drssnc.DSN_NS * ((400 * 15) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_TS2 = drssnc.DSN_NS * ((400 * 10) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                    case "LYS Y.DİL"://LYS Y.Dil
                        drssnc.DSN_MF1 = 0;
                        drssnc.DSN_MF2 = 0;
                        drssnc.DSN_MF3 = 0;
                        drssnc.DSN_MF4 = 0;
                        drssnc.DSN_TM1 = 0;
                        drssnc.DSN_TM2 = 0;
                        drssnc.DSN_TM3 = 0;
                        drssnc.DSN_TS1 = 0;
                        drssnc.DSN_TS2 = 0;
                        drssnc.DSN_DIL1 = drssnc.DSN_NS * ((400 * 65) / 100) / drssnc.DSN_SS;
                        drssnc.DSN_DIL2 = drssnc.DSN_NS * ((400 * 50) / 100) / drssnc.DSN_SS;
                        break;
                    default:
                        drssnc.DSN_MF1 = 0;
                        drssnc.DSN_MF2 = 0;
                        drssnc.DSN_MF3 = 0;
                        drssnc.DSN_MF4 = 0;
                        drssnc.DSN_TM1 = 0;
                        drssnc.DSN_TM2 = 0;
                        drssnc.DSN_TM3 = 0;
                        drssnc.DSN_TS1 = 0;
                        drssnc.DSN_TS2 = 0;
                        drssnc.DSN_DIL1 = 0;
                        drssnc.DSN_DIL2 = 0;
                        break;
                }


                //if ((Double)drssnc.DSN_PUAN < 0.00)
                //    drssnc.DSN_PUAN = 0;
                if (ekle)
                    entity.DRSSNVSNC.Add(drssnc);


                #endregion
        }
        

        protected void btn_Kaydet_Click(object sender, EventArgs e)
        {
            DataTable dt = null;
            if (Session["DataTable"] != null)
                dt = (DataTable) Session["DataTable"];

            EOBSEntities entity=new EOBSEntities();
            SINAVLAR snv = entity.SINAVLAR.First(x => x.SNV_ID == SNV_ID);

            
            if (dt != null && snv!=null)
            {
                KULLANICILAR kul;
                string oklKodu="";
                int ogrNo = 0;
                string TCKimlik = "";
                string Kitapcik = "";
                string cvpRef="";

                int okl_id = int.Parse(Session["AktifOkulId"].ToString());

                for (int i = 0; i < dt.Rows.Count;i++)
                {
                    kul=null;
                    //try
                    //{
                        ogrNo = int.Parse(dt.Rows[i][3].ToString().Trim());
                        TCKimlik = dt.Rows[i][4].ToString().Trim();
                        Kitapcik = dt.Rows[i][5].ToString().Trim();

                        if (krList1.SelectedValue == "0")
                        {
                            oklKodu = dt.Rows[i][2].ToString().Trim();
                            OKULLAR okul = entity.OKULLAR.First(x => x.OKL_KODU == oklKodu);
                            okl_id = okul.OKL_ID;
                        }

                        try
                        {
                            if (krList2.SelectedValue == "0")
                                kul = entity.KULLANICILAR.First(x => x.KUL_NO == ogrNo && x.OKL_ID == okl_id);
                            if (krList2.SelectedValue == "1")
                                kul = entity.KULLANICILAR.First(x => x.KUL_TCNO == TCKimlik && x.OKL_ID == okl_id);
                            if (krList2.SelectedValue == "2")
                                kul = entity.KULLANICILAR.First(x => x.KUL_NO == ogrNo && x.KUL_TCNO == TCKimlik && x.OKL_ID == okl_id);

                        }
                        catch
                        {
                            kul = null;
                        }

                        if (kul != null)
                        {

                            #region DERSLER
                            if (snv.SINAVDETAY.DERSLER != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS0SS, SNV_ID, snv.SINAVDETAY.DERSLER.DRS_ID, Kitapcik, dt.Rows[i][6].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS0KS, snv.SINAVDETAY.DERSLER.DRS_AD);
                            }
                            #endregion
                            #region DERSLER1
                            if (snv.SINAVDETAY.DERSLER1 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS1SS, SNV_ID, snv.SINAVDETAY.DERSLER1.DRS_ID, Kitapcik, dt.Rows[i][7].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS1KS, snv.SINAVDETAY.DERSLER1.DRS_AD);
                            }
                            #endregion
                            #region DERSLER2
                            if (snv.SINAVDETAY.DERSLER2 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS2SS, SNV_ID, snv.SINAVDETAY.DERSLER2.DRS_ID, Kitapcik, dt.Rows[i][8].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS2KS, snv.SINAVDETAY.DERSLER2.DRS_AD);
                            }
                            #endregion
                            #region DERSLER3
                            if (snv.SINAVDETAY.DERSLER3 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS3SS, SNV_ID, snv.SINAVDETAY.DERSLER3.DRS_ID, Kitapcik, dt.Rows[i][9].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS3KS, snv.SINAVDETAY.DERSLER3.DRS_AD);
                            }
                            #endregion
                            #region DERSLER4
                            if (snv.SINAVDETAY.DERSLER4 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS4SS, SNV_ID, snv.SINAVDETAY.DERSLER4.DRS_ID, Kitapcik, dt.Rows[i][10].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS4KS, snv.SINAVDETAY.DERSLER4.DRS_AD);
                            }
                            #endregion
                            #region DERSLER5
                            if (snv.SINAVDETAY.DERSLER5 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS5SS, SNV_ID, snv.SINAVDETAY.DERSLER5.DRS_ID, Kitapcik, dt.Rows[i][10].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS5KS, snv.SINAVDETAY.DERSLER5.DRS_AD);
                            }
                            #endregion
                            #region DERSLER6
                            if (snv.SINAVDETAY.DERSLER6 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS6SS, SNV_ID, snv.SINAVDETAY.DERSLER6.DRS_ID, Kitapcik, dt.Rows[i][11].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS6KS, snv.SINAVDETAY.DERSLER6.DRS_AD);
                            }
                            #endregion
                            #region DERSLER7
                            if (snv.SINAVDETAY.DERSLER7 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS7SS, SNV_ID, snv.SINAVDETAY.DERSLER7.DRS_ID, Kitapcik, dt.Rows[i][12].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS7KS, snv.SINAVDETAY.DERSLER7.DRS_AD);
                            }
                            #endregion
                            #region DERSLER8
                            if (snv.SINAVDETAY.DERSLER8 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS8SS, SNV_ID, snv.SINAVDETAY.DERSLER8.DRS_ID, Kitapcik, dt.Rows[i][13].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS8KS, snv.SINAVDETAY.DERSLER8.DRS_AD);
                            }
                            #endregion
                            #region DERSLER9
                            if (snv.SINAVDETAY.DERSLER9 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS9SS, SNV_ID, snv.SINAVDETAY.DERSLER9.DRS_ID, Kitapcik, dt.Rows[i][14].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS9KS, snv.SINAVDETAY.DERSLER9.DRS_AD);
                            }
                            #endregion
                            #region DERSLER10
                            if (snv.SINAVDETAY.DERSLER10 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS10SS, SNV_ID, snv.SINAVDETAY.DERSLER10.DRS_ID, Kitapcik, dt.Rows[i][15].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS10KS, snv.SINAVDETAY.DERSLER10.DRS_AD);
                            }
                            #endregion
                            #region DERSLER11
                            if (snv.SINAVDETAY.DERSLER11 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS11SS, SNV_ID, snv.SINAVDETAY.DERSLER11.DRS_ID, Kitapcik, dt.Rows[i][16].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS11KS, snv.SINAVDETAY.DERSLER11.DRS_AD);
                            }
                            #endregion
                            #region DERSLER12
                            if (snv.SINAVDETAY.DERSLER12 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS12SS, SNV_ID, snv.SINAVDETAY.DERSLER12.DRS_ID, Kitapcik, dt.Rows[i][17].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS12KS, snv.SINAVDETAY.DERSLER12.DRS_AD);
                            }
                            #endregion
                            #region DERSLER13
                            if (snv.SINAVDETAY.DERSLER13 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS13SS, SNV_ID, snv.SINAVDETAY.DERSLER13.DRS_ID, Kitapcik, dt.Rows[i][18].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS13KS, snv.SINAVDETAY.DERSLER13.DRS_AD);
                            }
                            #endregion
                            #region DERSLER14
                            if (snv.SINAVDETAY.DERSLER14 != null)
                            {
                                Hesapla(entity, snv, (short)snv.SINAVDETAY.SDT_DRS14SS, SNV_ID, snv.SINAVDETAY.DERSLER14.DRS_ID, Kitapcik, dt.Rows[i][19].ToString(), kul.KUL_ID, (Decimal)snv.SINAVDETAY.SDT_DRS14KS, snv.SINAVDETAY.DERSLER14.DRS_AD);
                            }
                            #endregion
                            string a = dt.Rows[i][1].ToString();
                            dt.Rows[i][1] = "E";
                            a = dt.Rows[i][1].ToString();
                            entity.SaveChanges();
                        }

                    //}
                    //catch
                    //{ 
                    //}
                }
                for (int l = 0; l < SoruAnalizList.Count; l++)
                {
                    for (int k = 0; k < SoruAnalizList[l].Count; k++)
                    {
                        entity.SORUANALIZ.Add(SoruAnalizList[l][k]);
                    }
                }
                entity.SaveChanges();

                Session["DataTable"] = dt;
                GridDamla.DataSource = dt;
                GridDamla.Rebind();
                
            }
            //Response.Redirect("ODS_SinavDegerlendir.aspx");
        }

       
    }
}
