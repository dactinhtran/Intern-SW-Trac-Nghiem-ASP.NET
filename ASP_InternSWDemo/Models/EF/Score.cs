namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Score")]
    public partial class Score
    {
        public int ScoreId { get; set; }

        public int? UserId { get; set; }

        [Column("Score")]
        public int? Score1 { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime TestDate { get; set; }

        [StringLength(500)]
        public string Detail { get; set; }

        public int? TopicId { get; set; }

        public virtual Topic Topic { get; set; }

        public virtual User User { get; set; }
    }
}
