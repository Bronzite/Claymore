//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Claymore.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Session
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Session()
        {
            this.Characters = new HashSet<Character>();
            this.Campaigns = new HashSet<Campaign>();
        }
    
        public System.Guid Id { get; set; }
        public string Name { get; set; }
        public System.DateTime SessionDate { get; set; }
        public Nullable<System.Guid> XPTransactionId { get; set; }
        public string BaseXP { get; set; }
        public Nullable<System.DateTime> InUniverseStartDate { get; set; }
        public System.DateTime InUniverseEndDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Character> Characters { get; set; }
        public virtual XPTransaction XPTransaction { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Campaign> Campaigns { get; set; }
    }
}
