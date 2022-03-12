namespace SmartLibrary.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Sach")]
    public partial class Sach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sach()
        {
            DangKyMuons = new HashSet<DangKyMuon>();
            MuonTras = new HashSet<MuonTra>();
        }

        [Key]
        [StringLength(10)]
        [Display(Name ="Mã sách")]
        [Required(ErrorMessage ="Mã sách không được để trống.")]
        public string MaSach { get; set; }

        [Required]
        [StringLength(100)]
        public string TenSach { get; set; }

        [StringLength(20)]
        public string MaLS { get; set; }

        [StringLength(500)]
        public string Tomtat { get; set; }

        [StringLength(150)]
        public string Anh { get; set; }

        [StringLength(50)]
        public string NhaXB { get; set; }

        [StringLength(10)]
        public string NamXB { get; set; }

        [StringLength(150)]
        public string Tacgia { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DangKyMuon> DangKyMuons { get; set; }

        public virtual LoaiSach LoaiSach { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MuonTra> MuonTras { get; set; }
    }
}
