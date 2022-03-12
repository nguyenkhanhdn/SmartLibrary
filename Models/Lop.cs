namespace SmartLibrary.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Lop")]
    public partial class Lop
    {
        public Lop()
        {
            Hocsinhs = new HashSet<Hocsinh>();
        }

        [Key]
        [StringLength(10)]
        [Required(ErrorMessage = "Mã lớp yêu cầu phải có.")]
        [Display(Name = "Mã lớp")]
        public string MaLop { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Tên lớp yêu cầu phải có.")]
        [Display(Name = "Tên lớp")]
        public string TenLop { get; set; }

        //attributes
        [Required (ErrorMessage ="Giáo viên chủ nhiệm yêu cầu phải có.")]
        [StringLength(50)]
        [Display(Name ="Giáo viên chủ nhiệm")]
        public string GVCN { get; set; } // properties

        [StringLength(100)]
        [Display(Name = "Ghi chú")]
        public string Ghichu { get; set; }

        public virtual ICollection<Hocsinh> Hocsinhs { get; set; }
    }
}
