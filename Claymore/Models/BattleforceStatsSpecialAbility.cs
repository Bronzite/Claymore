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
    
    public partial class BattleforceStatsSpecialAbility
    {
        public System.Guid Id { get; set; }
        public System.Guid SpecialAbilityId { get; set; }
        public Nullable<int> Parameter { get; set; }
        public Nullable<int> ShortRange { get; set; }
        public Nullable<int> MediumRange { get; set; }
        public Nullable<int> LongRange { get; set; }
        public System.Guid BattleforceStatsId { get; set; }
    
        public virtual SpecialAbility SpecialAbility { get; set; }
        public virtual BattleforceStats BattleforceStat { get; set; }
    }
}
