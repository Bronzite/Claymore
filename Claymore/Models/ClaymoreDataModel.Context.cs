﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ClaymoreDataModelContainer : DbContext
    {
        public ClaymoreDataModelContainer()
            : base("name=ClaymoreDataModelContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Character> Characters { get; set; }
        public virtual DbSet<Session> Sessions { get; set; }
        public virtual DbSet<XPAsset> XPAssets { get; set; }
        public virtual DbSet<XPTransaction> XPTransactions { get; set; }
        public virtual DbSet<XPChange> XPChanges { get; set; }
        public virtual DbSet<Campaign> Campaigns { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<CharacterOwnership> CharacterOwnerships { get; set; }
        public virtual DbSet<Capital> Capitals { get; set; }
        public virtual DbSet<Currency> Currencies { get; set; }
        public virtual DbSet<LiquidAssetChange> LiquidAssetChanges { get; set; }
    }
}
