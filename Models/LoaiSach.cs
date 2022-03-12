namespace SmartLibrary.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("LoaiSach")]
    public partial class LoaiSach
    {
        public LoaiSach()
        {
            Saches = new HashSet<Sach>();
        }

        [Key]
        [StringLength(20)]
        [Required(ErrorMessage ="Mã loại sách yêu cầu phải có.")]
        [Display(Name = "Mã loại sách")]
        public string MaLS { get; set; }

        [Required(ErrorMessage ="Tên loại sách yêu cầu phải nhập.")]
        [StringLength(100)]
        [Display(Name = "Loại sách")]
        public string TenLoai { get; set; }

        [Required(ErrorMessage ="Mô tả yêu cầu phải nhập.")]
        [StringLength(500)]
        [Display(Name = "Mô tả")]
        public string Mota { get; set; }

        [StringLength(100)]
        [Display(Name = "Ảnh mô tả")]
        public string Anh { get; set; }

        public virtual ICollection<Sach> Saches { get; set; }
    }
}
