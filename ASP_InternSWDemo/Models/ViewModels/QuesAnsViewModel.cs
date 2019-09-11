using Models.EF;
using System.Collections.Generic;


namespace Models.ViewModels
{
    public class QuesAnsViewModel
    {
        public int QuestionId { get; set; }
        public string QuestionName { get; set; }
        public List<AnsModel> ListAns { get; set; }
        public Question Ques { get; set; }
    }

    public class AnsModel
    {
        public string Ans { get; set; }
        public bool IsCorrect { get; set; }
    }

}
