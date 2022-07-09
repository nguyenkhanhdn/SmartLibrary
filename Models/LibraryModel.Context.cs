﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartLibrary.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class LibraryEntities : DbContext
    {
        public LibraryEntities()
            : base("name=LibraryEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<DangKyMuon> DangKyMuons { get; set; }
        public virtual DbSet<Hocsinh> Hocsinhs { get; set; }
        public virtual DbSet<LoaiSach> LoaiSaches { get; set; }
        public virtual DbSet<Lop> Lops { get; set; }
        public virtual DbSet<MuonTra> MuonTras { get; set; }
        public virtual DbSet<Sach> Saches { get; set; }
        public virtual DbSet<category> categories { get; set; }
    
        public virtual ObjectResult<GetMemberInfo_Result> GetMemberInfo(string userId)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetMemberInfo_Result>("GetMemberInfo", userIdParameter);
        }
    }
}
