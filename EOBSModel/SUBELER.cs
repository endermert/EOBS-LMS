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
    
    public partial class SUBELER
    {
        public SUBELER()
        {
            this.KULLANICILAR = new HashSet<KULLANICILAR>();
            this.ARA_TBL1 = new HashSet<ARA_TBL1>();
        }
    
        public int SUB_ID { get; set; }
        public string SUB_AD { get; set; }
        public Nullable<int> SUB_SIRA { get; set; }
        public Nullable<int> SNF_ID { get; set; }
        public Nullable<int> OKL_ID { get; set; }
    
        public virtual ICollection<KULLANICILAR> KULLANICILAR { get; set; }
        public virtual SINIFLAR SINIFLAR { get; set; }
        public virtual ICollection<ARA_TBL1> ARA_TBL1 { get; set; }
        public virtual OKULLAR OKULLAR { get; set; }
    }
}