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
    
    public partial class Auxiliary
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Auxiliary()
        {
            this.Trees = new HashSet<Tree>();
        }
    
        public int Aux_ID { get; set; }
        public Nullable<int> GL_ID { get; set; }
        public string Aux_Name { get; set; }
        public string Aux_Name_AR { get; set; }
        public string Entered_By { get; set; }
        public System.DateTime LastUpdate { get; set; }
        public string Status { get; set; }
    
        public virtual GL GL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tree> Trees { get; set; }
    }
}
