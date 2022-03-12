namespace SmartLibrary.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Hocsinh")]
    public partial class Hocsinh
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Hocsinh()
        {
            DangKyMuons = new HashSet<DangKyMuon>();
            MuonTras = new HashSet<MuonTra>();
        }

        [Key]
        [StringLength(10)]
        public string MaHS { get; set; }

        [Required]
        [StringLength(50)]
        public string TenHS { get; set; }

        [Required]
        [StringLength(10)]
        public string MaLop { get; set; }

        [Required]
        [StringLength(10)]
        public string Dienthoai { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Diachi { get; set; }

        [StringLength(50)]
        public string Phuhuynh { get; set; }

        [StringLength(100)]
        public string Anh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DangKyMuon> DangKyMuons { get; set; }

        public virtual Lop Lop { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MuonTra> MuonTras { get; set; }
    }
}
