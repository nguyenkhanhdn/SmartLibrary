namespace SmartLibrary.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MuonTra")]
    public partial class MuonTra
    {
        public int Id { get; set; }

        [Required]
        [StringLength(10)]
        public string MaHS { get; set; }

        [Required]
        [StringLength(10)]
        public string MaSach { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayMuon { get; set; }

        [Column(TypeName = "date")]
        public DateTime Ngaytra { get; set; }

        [StringLength(100)]
        public string Ghichu { get; set; }

        [Column(TypeName = "date")]
        public DateTime Ngayphaitra { get; set; }

        public double? Tienphat { get; set; }

        public virtual Hocsinh Hocsinh { get; set; }

        public virtual Sach Sach { get; set; }
    }
}
