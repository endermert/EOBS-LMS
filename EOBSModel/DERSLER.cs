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
    
    public partial class DERSLER
    {
        public DERSLER()
        {
            this.DRSSNVSNC = new HashSet<DRSSNVSNC>();
            this.KARNEDERS = new HashSet<KARNEDERS>();
            this.KARNEDERSNOT = new HashSet<KARNEDERSNOT>();
            this.RDSDERSLER = new HashSet<RDSDERSLER>();
            this.SINAVDETAY = new HashSet<SINAVDETAY>();
            this.SINAVDETAY1 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY2 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY3 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY4 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY5 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY6 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY7 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY8 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY9 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY10 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY11 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY12 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY13 = new HashSet<SINAVDETAY>();
            this.SINAVDETAY14 = new HashSet<SINAVDETAY>();
            this.SORUANALIZ = new HashSet<SORUANALIZ>();
        }
    
        public int DRS_ID { get; set; }
        public string DRS_AD { get; set; }
        public Nullable<int> DRS_SIRA { get; set; }
    
        public virtual ICollection<DRSSNVSNC> DRSSNVSNC { get; set; }
        public virtual ICollection<KARNEDERS> KARNEDERS { get; set; }
        public virtual ICollection<KARNEDERSNOT> KARNEDERSNOT { get; set; }
        public virtual ICollection<RDSDERSLER> RDSDERSLER { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY1 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY2 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY3 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY4 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY5 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY6 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY7 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY8 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY9 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY10 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY11 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY12 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY13 { get; set; }
        public virtual ICollection<SINAVDETAY> SINAVDETAY14 { get; set; }
        public virtual ICollection<SORUANALIZ> SORUANALIZ { get; set; }
    }
}