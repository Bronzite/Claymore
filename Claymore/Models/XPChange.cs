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
    
    public partial class XPChange
    {
        public System.Guid Id { get; set; }
        public System.Guid XPTransactionId { get; set; }
        public int Amount { get; set; }
        public System.Guid XPAssetId { get; set; }
    
        public virtual XPTransaction Transaction { get; set; }
        public virtual XPAsset XPAsset { get; set; }
    }
}
