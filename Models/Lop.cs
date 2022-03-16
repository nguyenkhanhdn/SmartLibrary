namespace SmartLibrary.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Lop")]
    public partial class Lop
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Lop()
        {
            Hocsinhs = new HashSet<Hocsinh>();
        }

        [Key]
        [StringLength(10)]
        public string MaLop { get; set; }

        [Required]
        [StringLength(50)]
        public string TenLop { get; set; }

        [Required]
        [StringLength(50)]
        public string GVCN { get; set; }

        [StringLength(100)]
        public string Ghichu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hocsinh> Hocsinhs { get; set; }
    }
}
