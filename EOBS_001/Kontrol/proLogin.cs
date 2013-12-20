using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EOBSModel;

namespace EOBS_001.Kontrol
{
    public class proLogin
    {
        
        public static KULLANICILAR Giris(string kulAd,string kulSifre)
        { 
            EOBSEntities entity = new EOBSEntities();
            KULLANICILAR kul = new KULLANICILAR();
            try
            {
                kul = entity.KULLANICILAR.First(x => x.KUL_AD == kulAd && x.KUL_SIFRE == kulSifre);
            }
            catch
            {
                kul = null;
            }

            return kul;
        }
        public static List<String> SayfaYetkilendir(short YTK_ID)
        {
            List<String> Sayfalar = new List<string>();
            Sayfalar.Add("Giris.aspx");
            Sayfalar.Add("GNL_Ayarlar.aspx");
            Sayfalar.Add("GNL_Mesajlar.aspx");
            Sayfalar.Add("HEP_VeriGiris.aspx");
            Sayfalar.Add("HKS_Damlaciklar.aspx");
            Sayfalar.Add("");
            Sayfalar.Add("");
            Sayfalar.Add("");
            Sayfalar.Add("");
            Sayfalar.Add("");
            Sayfalar.Add("");
            Sayfalar.Add("");
            Sayfalar.Add("");
            Sayfalar.Add("");
            Sayfalar.Add("");
            Sayfalar.Add("");


            return Sayfalar;
        }
    }
}