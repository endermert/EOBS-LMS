using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EOBSModel;
namespace EOBS_001
{
    public partial class ODS_SinavDegerlendirDiger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["AktifOkulId"] == null)
                    if (Session["KulYetki"] != null)
                        if (Session["KulYetki"].ToString() == "111") //yönetici
                        {
                            if (Request.Path != "/Yonet_Okullar.aspx")
                                Response.Redirect("Yonet_Okullar.aspx");
                        }
                        else
                        {
                            if (Request.Path != "/Sec_Okul.aspx")
                                Response.Redirect("Sec_Okul.aspx");
                        }
            }
            catch
            {

            }
            EDS_Sinavlar.WhereParameters.Clear();
            EDS_Sinavlar.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

            EDS_Sinif.WhereParameters.Clear();
            EDS_Sinif.WhereParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());

            EDS_Sinavlar.InsertParameters.Clear();
            EDS_Sinavlar.InsertParameters.Add("OKL_ID", System.Data.DbType.Int32, Session["AktifOkulId"].ToString());
        }

        protected void GridDamla_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridDamla.SelectedValue != null)
                Response.Redirect("ODS_SinavTxtUp1.aspx?ref=" + GridDamla.SelectedValue.ToString());
        }

        protected void GridDamla_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            e.Canceled = true;
            if (e.CommandArgument.ToString() == "DEG")
            {
                int snv_id = int.Parse(e.Item.Cells[2].Text);
                EOBSEntities entity = new EOBSEntities();
                SINAVLAR snv = entity.SINAVLAR.First(x=>x.SNV_ID==snv_id);

                //var SubList1 = entity.SINAVSNC.Where(x => x.SNV_ID == snv_id).Select(x => x.KULLANICILAR.SUB_ID).Distinct();
                //var SnfList1 = entity.SINAVSNC.Where(x => x.SNV_ID == snv_id).Select(x => x.KULLANICILAR.SNF_ID).Distinct();
                //var OklList1 = entity.SINAVSNC.Where(x => x.SNV_ID == snv_id).Select(x => x.KULLANICILAR.OKL_ID).Distinct();

                var SubList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id).Select(x => x.KULLANICILAR.SUB_ID).Distinct();
                var SnfList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id).Select(x => x.KULLANICILAR.SNF_ID).Distinct();
                var OklList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id).Select(x => x.KULLANICILAR.OKL_ID).Distinct();

                if(snv.SINAVDETAY.DERSLER!=null)
                {
                    int drs_id=snv.SINAVDETAY.DERSLER.DRS_ID;
                    //var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).OrderByDescending(x => x.DSN_NS);
                    //var SubList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SUB_ID).Distinct();
                    //var SnfList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SNF_ID).Distinct();
                    //var OklList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.OKL_ID).Distinct();
                    DersDegerlendir(entity, snv_id, drs_id,SubList, SnfList,OklList);
                    
                    entity.SaveChanges();
                }

                if (snv.SINAVDETAY.DERSLER1 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER1.DRS_ID;
                    //var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).OrderByDescending(x => x.DSN_NS);
                    //var SubList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SUB_ID).Distinct();
                    //var SnfList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SNF_ID).Distinct();
                    //var OklList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.OKL_ID).Distinct();
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);

                    entity.SaveChanges();
                }

                if (snv.SINAVDETAY.DERSLER2 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER2.DRS_ID;
                    //var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).OrderByDescending(x => x.DSN_NS);
                    //var SubList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SUB_ID).Distinct();
                    //var SnfList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SNF_ID).Distinct();
                    //var OklList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.OKL_ID).Distinct();
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);

                    entity.SaveChanges();
                }

                if (snv.SINAVDETAY.DERSLER3 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER3.DRS_ID;
                    //var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).OrderByDescending(x => x.DSN_NS);
                    //var SubList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SUB_ID).Distinct();
                    //var SnfList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SNF_ID).Distinct();
                    //var OklList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.OKL_ID).Distinct();
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);

                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER4 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER4.DRS_ID;
                    //var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).OrderByDescending(x => x.DSN_NS);
                    //var SubList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SUB_ID).Distinct();
                    //var SnfList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.SNF_ID).Distinct();
                    //var OklList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).Select(x => x.KULLANICILAR.OKL_ID).Distinct();
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);

                    entity.SaveChanges();
                }
                
                if (snv.SINAVDETAY.DERSLER5 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER5.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER6 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER6.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER7 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER7.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER8 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER8.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER9 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER9.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER10 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER10.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER11 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER11.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER12 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER12.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER13 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER13.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }
                if (snv.SINAVDETAY.DERSLER14 != null)
                {
                    int drs_id = snv.SINAVDETAY.DERSLER14.DRS_ID;
                    DersDegerlendir(entity, snv_id, drs_id, SubList, SnfList, OklList);
                    entity.SaveChanges();
                }

                var KulList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id).Select(x => x.KULLANICILAR.KUL_ID).Distinct();
                foreach (var kul_id in KulList)
                {
                    int SNS_SS = 0;
                    int SNS_DS = 0;
                    int SNS_YS = 0;
                    int SNS_BS = 0;
                    Double SNS_NS = 0;
                    Double SNS_PUAN = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_YGS1 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_YGS2 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_YGS3 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_YGS4 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_YGS5 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_YGS6 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_MF1 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_MF2 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_MF3 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_MF4 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_TM1 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_TM2 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_TM3 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_TS1 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_TS2 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_DIL1 = (Double)snv.SINAVDETAY.SDT_TABPUAN;
                    Double SNS_DIL2 = (Double)snv.SINAVDETAY.SDT_TABPUAN;

                    var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.KULLANICILAR.KUL_ID == kul_id);
                    foreach (var item in SncList)
                    {
                        SNS_SS = SNS_SS + (int)item.DSN_SS;
                        SNS_DS = SNS_DS + (int)item.DSN_DS;
                        SNS_YS = SNS_YS + (int)item.DSN_YS;
                        SNS_BS = SNS_BS + (int)item.DSN_BS;
                        SNS_NS = SNS_NS + (Double)item.DSN_NS;
                        SNS_PUAN = SNS_PUAN + (Double)item.DSN_PUAN;
                        SNS_YGS1 = SNS_YGS1 + (Double)item.DSN_YGS1;
                        SNS_YGS2 = SNS_YGS2 + (Double)item.DSN_YGS2;
                        SNS_YGS3 = SNS_YGS3 + (Double)item.DSN_YGS3;
                        SNS_YGS4 = SNS_YGS4 + (Double)item.DSN_YGS4;
                        SNS_YGS5 = SNS_YGS5 + (Double)item.DSN_YGS5;
                        SNS_YGS6 = SNS_YGS6 + (Double)item.DSN_YGS6;
                        SNS_MF1 = SNS_MF1 + (Double)item.DSN_MF1;
                        SNS_MF2 = SNS_MF2 + (Double)item.DSN_MF2;
                        SNS_MF3 = SNS_MF3 + (Double)item.DSN_MF3;
                        SNS_MF4 = SNS_MF4 + (Double)item.DSN_MF4;
                        SNS_TM1 = SNS_TM1 + (Double)item.DSN_TM1;
                        SNS_TM2 = SNS_TM2 + (Double)item.DSN_TM2;
                        SNS_TM3 = SNS_TM3 + (Double)item.DSN_TM3;
                        SNS_TS1 = SNS_TS1 + (Double)item.DSN_TS1;
                        SNS_TS2 = SNS_TS2 + (Double)item.DSN_TS2;
                        SNS_DIL1 = SNS_DIL1 + (Double)item.DSN_DIL1;
                        SNS_DIL2 = SNS_DIL2 + (Double)item.DSN_DIL2;
                    }
                    SINAVSNC snvsnc;
                    Boolean Ekle = false;
                    try
                    {
                        snvsnc = entity.SINAVSNC.First(x => x.SNV_ID == snv_id && x.KUL_ID == kul_id);
                        Ekle = false;
                    }
                    catch
                    {
                        snvsnc = new SINAVSNC();
                        Ekle = true;
                    }
                    snvsnc.SNV_ID = snv_id;
                    snvsnc.KUL_ID = kul_id;
                    snvsnc.SNS_SS = (short)SNS_SS;
                    snvsnc.SNS_DS = (short)SNS_DS;
                    snvsnc.SNS_YS = (short)SNS_YS;
                    snvsnc.SNS_BS = (short)SNS_BS;
                    snvsnc.SNS_NS = (Decimal)SNS_NS;
                    snvsnc.SNS_PUAN = (Decimal)SNS_PUAN;
                    snvsnc.SNS_YGS1 = (Decimal)SNS_YGS1;
                    snvsnc.SNS_YGS2 = (Decimal)SNS_YGS2;
                    snvsnc.SNS_YGS3 = (Decimal)SNS_YGS3;
                    snvsnc.SNS_YGS4 = (Decimal)SNS_YGS4;
                    snvsnc.SNS_YGS5 = (Decimal)SNS_YGS5;
                    snvsnc.SNS_YGS6 = (Decimal)SNS_YGS6;
                    snvsnc.SNS_MF1 = (Decimal)SNS_MF1;
                    snvsnc.SNS_MF2 = (Decimal)SNS_MF2;
                    snvsnc.SNS_MF3 = (Decimal)SNS_MF3;
                    snvsnc.SNS_MF4 = (Decimal)SNS_MF4;
                    snvsnc.SNS_TM1 = (Decimal)SNS_TM1;
                    snvsnc.SNS_TM2 = (Decimal)SNS_TM2;
                    snvsnc.SNS_TM3 = (Decimal)SNS_TM3;
                    snvsnc.SNS_TS1 = (Decimal)SNS_TS1;
                    snvsnc.SNS_TS2 = (Decimal)SNS_TS2;
                    snvsnc.SNS_DIL1 = (Decimal)SNS_DIL1;
                    snvsnc.SNS_DIL2 = (Decimal)SNS_DIL2;

                    if (Ekle)
                        entity.SINAVSNC.Add(snvsnc);
                }
                entity.SaveChanges();
                foreach (var sub_id in SubList)
                {
                    var SncList = entity.SINAVSNC.Where(x => x.SNV_ID == snv_id && x.KULLANICILAR.SUB_ID == sub_id).OrderByDescending(x => x.SNS_PUAN);
                    Double ONS;
                    Double TNS = 0.00;
                    short sira = 0;
                    Decimal EsitP = 0;
                    foreach (var item in SncList)
                    {
                        TNS = TNS + (Double)item.SNS_NS;
                    }
                    ONS = TNS / SncList.Count();
                    int sy = SncList.Count();
                    foreach (var item in SncList)
                    {
                        sira++;
                        SINAVSNC snc = entity.SINAVSNC.First(x => x.SNS_ID == item.SNS_ID);
                        snc.SNS_ORTSUB = (Decimal)ONS;

                        if (snc.SNS_PUAN == EsitP && sira != 1)
                            sira--;
                        EsitP = (Decimal)snc.SNS_PUAN;
                        snc.SNS_SRASUB = sira;
                        snc.SNS_TOPSUB = (short)SncList.Count();

                        if (item.SNS_SS == 0)
                            snc.SNS_BSRYZD = 0;
                        else
                            snc.SNS_BSRYZD = (item.SNS_NS * 100) / item.SNS_SS;
                        if (snc.SNS_BSRYZD >= 0 && snc.SNS_BSRYZD < 45)
                            snc.SNS_BSRYRM = "KÖTÜ";
                        if (snc.SNS_BSRYZD >= 45 && snc.SNS_BSRYZD < 60)
                            snc.SNS_BSRYRM = "ORTA";
                        if (snc.SNS_BSRYZD >= 60 && snc.SNS_BSRYZD < 75)
                            snc.SNS_BSRYRM = "İYİ";
                        if (snc.SNS_BSRYZD >= 75 && snc.SNS_BSRYZD <= 100)
                            snc.SNS_BSRYRM = "PEKİYİ";
                    }

                }
                entity.SaveChanges();

                foreach (var snf_id in SnfList)
                {
                    var SncList = entity.SINAVSNC.Where(x => x.SNV_ID == snv_id && x.KULLANICILAR.SNF_ID == snf_id).OrderByDescending(x => x.SNS_PUAN);
                    Double ONS;
                    Double TNS = 0.00;
                    short sira = 0;
                    Decimal EsitP = 0;
                    foreach (var item in SncList)
                    {
                        TNS = TNS + (Double)item.SNS_NS;
                    }
                    ONS = TNS / SncList.Count();
                    int sy = SncList.Count();
                    foreach (var item in SncList)
                    {
                        sira++;
                        SINAVSNC snc = entity.SINAVSNC.First(x => x.SNS_ID == item.SNS_ID);
                        snc.SNS_ORTSNF = (Decimal)ONS;

                        if (snc.SNS_PUAN == EsitP && sira != 1)
                            sira--;
                        EsitP = (Decimal)snc.SNS_PUAN;
                        snc.SNS_SRASNF = sira;
                        snc.SNS_TOPSNF = (short)SncList.Count();
                    }

                }
                entity.SaveChanges();
                foreach (var okl_id in OklList)
                {
                    var SncList = entity.SINAVSNC.Where(x => x.SNV_ID == snv_id && x.KULLANICILAR.OKL_ID == okl_id).OrderByDescending(x => x.SNS_PUAN);
                    Double ONS;
                    Double TNS = 0.00;
                    short sira = 0;
                    Decimal EsitP = 0;
                    foreach (var item in SncList)
                    {
                        TNS = TNS + (Double)item.SNS_NS;
                    }
                    ONS = TNS / SncList.Count();
                    int sy = SncList.Count();
                    foreach (var item in SncList)
                    {
                        sira++;
                        SINAVSNC snc = entity.SINAVSNC.First(x => x.SNS_ID == item.SNS_ID);
                        snc.SNS_ORTOKL = (Decimal)ONS;

                        if (snc.SNS_PUAN == EsitP && sira != 1)
                            sira--;
                        EsitP = (Decimal)snc.SNS_PUAN;
                        snc.SNS_SRAOKL = sira;
                        snc.SNS_TOPOKL = (short)SncList.Count();
                    }
                }
                entity.SaveChanges();
                for (int i = 0; i < 1; i++)
                {
                    var SncList = entity.SINAVSNC.Where(x => x.SNV_ID == snv_id).OrderByDescending(x => x.SNS_PUAN);
                    Double ONS;
                    Double TNS = 0.00;
                    short sira = 0;
                    Decimal EsitP = 0;
                    foreach (var item in SncList)
                    {
                        TNS = TNS + (Double)item.SNS_NS;
                    }
                    ONS = TNS / SncList.Count();
                    int sy = SncList.Count();
                    foreach (var item in SncList)
                    {
                        sira++;
                        SINAVSNC snc = entity.SINAVSNC.First(x => x.SNS_ID == item.SNS_ID);
                        snc.SNS_ORTKRM = (Decimal)ONS;

                        if (snc.SNS_PUAN == EsitP && sira != 1)
                            sira--;
                        EsitP = (Decimal)snc.SNS_PUAN;
                        snc.SNS_SRAKRM = sira;
                        snc.SNS_TOPKRM = (short)SncList.Count();
                    }

                }


                snv.SNV_DEGTAR = DateTime.Now;
                snv.SNV_DEG = true;
                entity.SaveChanges();
                GridDamla.Rebind();
            }
            if (e.CommandArgument.ToString() == "TEM")
            {
                int snv_id = int.Parse(e.Item.Cells[2].Text);
                EOBSEntities entity = new EOBSEntities();

                var list = entity.DRSSNVSNC.Where(x=>x.SNV_ID==snv_id);
                foreach (var drssnc in list)
                    entity.DRSSNVSNC.Remove(drssnc);

                var list1 = entity.SINAVSNC.Where(x => x.SNV_ID == snv_id);
                foreach (var snvsnc in list1)
                    entity.SINAVSNC.Remove(snvsnc);

                SINAVLAR snv = entity.SINAVLAR.First(x => x.SNV_ID == snv_id);
                snv.SNV_DEGTAR = null;
                snv.SNV_DEG = false;
                entity.SaveChanges();
                GridDamla.Rebind();
            }
        }

        private void DersDegerlendir(EOBSEntities entity, int snv_id, int drs_id, IQueryable<int?> SubList, IQueryable<int?> SnfList, IQueryable<int?> OklList)
        {
            
            foreach (var sub_id in SubList)
            {
                var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id && x.KULLANICILAR.SUB_ID == sub_id).OrderByDescending(x => x.DSN_NS);
                Double ONS;
                Double TNS = 0.00;
                short sira = 0;
                Decimal EsitNS = 0;
                foreach (var item in SncList)
                {
                    TNS = TNS + (Double)item.DSN_NS;
                }
                ONS = TNS / SncList.Count();
                int sy = SncList.Count();
                foreach (var item in SncList)
                {
                    sira++;
                    DRSSNVSNC snc = entity.DRSSNVSNC.First(x => x.DSN_ID == item.DSN_ID);
                    snc.DSN_ORTSUB = (Decimal)ONS;

                    if (snc.DSN_NS == EsitNS && sira != 1)
                        sira--;
                    EsitNS = (Decimal)snc.DSN_NS;
                    snc.DSN_SRASUB = sira;
                    snc.DSN_TOPSUB = (short)SncList.Count();

                    if (item.DSN_SS == 0)
                        snc.DSN_BSRYZD = 0;
                    else
                        snc.DSN_BSRYZD = (item.DSN_NS * 100) / item.DSN_SS;
                    if (snc.DSN_BSRYZD >= 0 && snc.DSN_BSRYZD < 45)
                        snc.DSN_BSRYRM = "KÖTÜ";
                    if (snc.DSN_BSRYZD >= 45 && snc.DSN_BSRYZD < 60)
                        snc.DSN_BSRYRM = "ORTA";
                    if (snc.DSN_BSRYZD >= 60 && snc.DSN_BSRYZD < 75)
                        snc.DSN_BSRYRM = "İYİ";
                    if (snc.DSN_BSRYZD >= 75 && snc.DSN_BSRYZD <= 100)
                        snc.DSN_BSRYRM = "PEKİYİ";
                }

            }
            foreach (var snf_id in SnfList)
            {
                var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id && x.KULLANICILAR.SNF_ID == snf_id).OrderByDescending(x => x.DSN_NS);
                Double ONS;
                Double TNS = 0.00;
                short sira = 0;
                Decimal EsitNS = 0;
                foreach (var item in SncList)
                {
                    TNS = TNS + (Double)item.DSN_NS;
                }
                ONS = TNS / SncList.Count();
                int sy = SncList.Count();
                foreach (var item in SncList)
                {
                    sira++;
                    DRSSNVSNC snc = entity.DRSSNVSNC.First(x => x.DSN_ID == item.DSN_ID);
                    snc.DSN_ORTSNF = (Decimal)ONS;

                    if (snc.DSN_NS == EsitNS && sira != 1)
                        sira--;
                    EsitNS = (Decimal)snc.DSN_NS;
                    snc.DSN_SRASNF = sira;
                    snc.DSN_TOPSNF = (short)SncList.Count();
                }

            }
            foreach (var Okl_id in OklList)
            {
                var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id && x.KULLANICILAR.OKL_ID == Okl_id).OrderByDescending(x => x.DSN_NS);
                Double ONS;
                Double TNS = 0.00;
                short sira = 0;
                Decimal EsitNS = 0;
                foreach (var item in SncList)
                {
                    TNS = TNS + (Double)item.DSN_NS;
                }
                ONS = TNS / SncList.Count();
                int sy = SncList.Count();
                foreach (var item in SncList)
                {
                    sira++;
                    DRSSNVSNC snc = entity.DRSSNVSNC.First(x => x.DSN_ID == item.DSN_ID);
                    snc.DSN_ORTOKL = (Decimal)ONS;

                    if (snc.DSN_NS == EsitNS && sira != 1)
                        sira--;
                    EsitNS = (Decimal)snc.DSN_NS;
                    snc.DSN_SRAOKL = sira;
                    snc.DSN_TOPOKL = (short)SncList.Count();
                }

            }

            for (int i = 0; i < 1; i++)
            {
                var SncList = entity.DRSSNVSNC.Where(x => x.SNV_ID == snv_id && x.DRS_ID == drs_id).OrderByDescending(x => x.DSN_NS);
                Double ONS;
                Double TNS = 0.00;
                short sira = 0;
                Decimal EsitNS = 0;
                foreach (var item in SncList)
                {
                    TNS = TNS + (Double)item.DSN_NS;
                }
                ONS = TNS / SncList.Count();
                int sy = SncList.Count();
                foreach (var item in SncList)
                {
                    sira++;
                    DRSSNVSNC snc = entity.DRSSNVSNC.First(x => x.DSN_ID == item.DSN_ID);
                    snc.DSN_ORTKRM = (Decimal)ONS;

                    if (snc.DSN_NS == EsitNS && sira != 1)
                        sira--;
                    EsitNS = (Decimal)snc.DSN_NS;
                    snc.DSN_SRAKRM = sira;
                    snc.DSN_TOPKRM = (short)SncList.Count();
                }

            }

        }
    }
}