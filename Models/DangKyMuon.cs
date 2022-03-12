namespace SmartLibrary.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DangKyMuon")]
    public partial class DangKyMuon
    {
        public int Id { get; set; }

        [Required]
        [StringLength(10)]
        public string MaHS { get; set; }

        [Required]
        [StringLength(10)]
        public string MaSach { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayDK { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayNhan { get; set; }

        [Required]
        [StringLength(50)]
        public string Phuongthuc { get; set; }

        [StringLength(80)]
        public string Diachi { get; set; }

        [StringLength(10)]
        public string Dienthoai { get; set; }

        [StringLength(50)]
        public string Ghichu { get; set; }

        public virtual Hocsinh Hocsinh { get; set; }

        public virtual Sach Sach { get; set; }
    }
}
