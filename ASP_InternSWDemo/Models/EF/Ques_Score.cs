namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Ques_Score
    {
        [Key]
        public int Ques_Score_Id { get; set; }

        public int UserId { get; set; }

        public int QuestionId { get; set; }

        public int AnswerId { get; set; }

        public virtual Answer Answer { get; set; }

        public virtual User User { get; set; }
    }
}
