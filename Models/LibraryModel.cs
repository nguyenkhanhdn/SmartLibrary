using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Configuration;

namespace SmartLibrary.Models
{
    public partial class LibraryModel : DbContext
    {
        public LibraryModel()
            : base("name=LibraryModel")
        {
        }

        public virtual DbSet<DangKyMuon> DangKyMuons { get; set; }
        public virtual DbSet<Hocsinh> Hocsinhs { get; set; }
        public virtual DbSet<LoaiSach> LoaiSaches { get; set; }
        public virtual DbSet<Lop> Lops { get; set; }
        public virtual DbSet<MuonTra> MuonTras { get; set; }
        public virtual DbSet<Sach> Saches { get; set; }
        public MemberInfo GetMemberInfo(string userid)
        {
            MemberInfo mi = new MemberInfo();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["LibraryModel"].ConnectionString;
            SqlCommand cmd = new SqlCommand("GetMemberInfo", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@userid", userid);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                mi.Email = reader["Email"].ToString();
                mi.UserName = reader["UserName"].ToString();
                mi.PhoneNumber = reader["PhoneNumber"].ToString();
            }

            con.Close();
            return mi;

        }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DangKyMuon>()
                .Property(e => e.MaHS)
                .IsUnicode(false);

            modelBuilder.Entity<DangKyMuon>()
                .Property(e => e.MaSach)
                .IsUnicode(false);

            modelBuilder.Entity<DangKyMuon>()
                .Property(e => e.Dienthoai)
                .IsUnicode(false);

            modelBuilder.Entity<Hocsinh>()
                .Property(e => e.MaHS)
                .IsUnicode(false);

            modelBuilder.Entity<Hocsinh>()
                .Property(e => e.MaLop)
                .IsUnicode(false);

            modelBuilder.Entity<Hocsinh>()
                .Property(e => e.Dienthoai)
                .IsUnicode(false);

            modelBuilder.Entity<Hocsinh>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Hocsinh>()
                .HasMany(e => e.DangKyMuons)
                .WithRequired(e => e.Hocsinh)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Hocsinh>()
                .HasMany(e => e.MuonTras)
                .WithRequired(e => e.Hocsinh)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Lop>()
                .Property(e => e.MaLop)
                .IsUnicode(false);

            modelBuilder.Entity<Lop>()
                .HasMany(e => e.Hocsinhs)
                .WithRequired(e => e.Lop)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MuonTra>()
                .Property(e => e.MaHS)
                .IsUnicode(false);

            modelBuilder.Entity<MuonTra>()
                .Property(e => e.MaSach)
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .Property(e => e.MaSach)
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .Property(e => e.NamXB)
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .HasMany(e => e.DangKyMuons)
                .WithRequired(e => e.Sach)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Sach>()
                .HasMany(e => e.MuonTras)
                .WithRequired(e => e.Sach)
                .WillCascadeOnDelete(false);
        }
    }
}
