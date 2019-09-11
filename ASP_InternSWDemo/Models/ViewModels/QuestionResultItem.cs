using System.Collections.Generic;

namespace Models.ViewModels
{
    public class QuestionResultItem
    {
        public string QuestionName { get; set;}
        public int QuestionId { get; set;}
        public int TopicId { get; set;}
        public string AnswerName { get; set; }
        public int AnswerId { get; set; }
        public List<AnswerInfoItem> Answers { get; set; }
    }

    public class AnswerInfoItem
    {
        public string AnswerName { get; set; }
        public int AnswerId { get; set; }
        public bool IsCorrect { get; set; }
    }
}