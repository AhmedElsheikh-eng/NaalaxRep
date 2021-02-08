//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NMS.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Invoice
    {
        public int Invoice_ID { get; set; }
        public System.DateTime Isuue_Date { get; set; }
        public Nullable<int> Cus_ID { get; set; }
        public Nullable<int> Supp_ID { get; set; }
        public Nullable<int> Comp_ID { get; set; }
        public int Item_ID { get; set; }
        public int Unit_ID { get; set; }
        public int Qunt { get; set; }
        public double Price_Unit { get; set; }
        public Nullable<double> DisCount { get; set; }
        public int Branch_ID { get; set; }
        public Nullable<int> Tax_No { get; set; }
        public Nullable<int> Tax_NoFor_Comp { get; set; }
        public string Payment_Method { get; set; }
        public int Curr_ID { get; set; }
        public Nullable<int> WareHouse_ID { get; set; }
        public string Status { get; set; }
        public System.DateTime LastUpdate { get; set; }
        public string Entered_By { get; set; }
    
        public virtual Branch Branch { get; set; }
        public virtual Company Company { get; set; }
        public virtual Currency Currency { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual Item Item { get; set; }
        public virtual Supplier Supplier { get; set; }
        public virtual Unit Unit { get; set; }
        public virtual WareHouse WareHouse { get; set; }
    }
}
