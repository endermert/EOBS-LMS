using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CMFCell;
using EOBSModel;

namespace EOBS_001.Kontrol
{
    public class Sms
    {
        public Boolean Gonder(int OKL_ID,String GSM,String Mesaj)
        {
            Boolean Durum = false;
            try
            {
                EOBSEntities entity = new EOBSEntities();

                OKULLAR Okul = entity.OKULLAR.First(x=>x.OKL_ID==OKL_ID);

                SmsMessage _message = new SmsMessage();
                _message.Message = Mesaj;
                _message.Originator = Okul.OKL_SMSBASLIK;
                _message.Recipients.Add(GSM);
                
                SmsMessage _sentMessage = null;
                try
                {
                    Uri uri = new Uri("http://smsc.cmfcell.com/api/xml/default.aspx");
                    _sentMessage = _message.Send(uri, Okul.OKL_SMSKULAD, Okul.OKL_SMSSIFRE);

                    Durum = true;
                    
                }
                catch (Exception _ex)
                {
                }
            }
            catch (Exception _ex)
            {
            }

            return Durum;
        }
    }
}