using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EOBS_001.Kontrol
{
    public class Fonk
    {
        public static String TrKrktrYokEt(String trStr,Boolean SadeBuyukler)
        {
            if (SadeBuyukler)
            {
                trStr = trStr.Replace('İ', 'I');
                trStr = trStr.Replace('Ğ', 'G');
                trStr = trStr.Replace('Ü', 'U');
                trStr = trStr.Replace('Ş', 'S');
                trStr = trStr.Replace('Ö', 'O');
                trStr = trStr.Replace('Ç', 'C');
            }
            else
            {
                trStr = trStr.Replace('İ', 'I');
                trStr = trStr.Replace('Ğ', 'G');
                trStr = trStr.Replace('Ü', 'U');
                trStr = trStr.Replace('Ş', 'S');
                trStr = trStr.Replace('Ö', 'O');
                trStr = trStr.Replace('Ç', 'C');

                trStr = trStr.Replace('ı', 'i');
                trStr = trStr.Replace('ğ', 'g');
                trStr = trStr.Replace('ü', 'u');
                trStr = trStr.Replace('ş', 's');
                trStr = trStr.Replace('ö', 'o');
                trStr = trStr.Replace('ç', 'c');

            }

            return trStr;
        }
    }
}