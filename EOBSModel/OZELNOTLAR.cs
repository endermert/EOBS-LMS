//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EOBSModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class OZELNOTLAR
    {
        public OZELNOTLAR()
        {
            this.OZELNOT = new HashSet<OZELNOT>();
        }
    
        public int OZL_ID { get; set; }
        public string OZL_AD { get; set; }
        public string OZL_METIN { get; set; }
        public Nullable<int> HFT_ID { get; set; }
        public Nullable<int> OKL_ID { get; set; }
        public string SUB_ADS { get; set; }
        public Nullable<int> KUL_ID { get; set; }
    
        public virtual ICollection<OZELNOT> OZELNOT { get; set; }
    }
}