namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Answer")]
    public partial class Answer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Answer()
        {
            Ques_Score = new HashSet<Ques_Score>();
        }

        public int AnswerId { get; set; }

        [Column("Answer")]
        [DisplayName("Đáp án :")]
        [StringLength(500)]
        public string Answer1 { get; set; }

        [DisplayName("Đúng/Sai :")]
        public bool? IsCorrect { get; set; }

        [DisplayName("Câu hỏi :")]
        public int? QuestionId { get; set; }
        
        public virtual Question Question { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ques_Score> Ques_Score { get; set; }
    }
}
