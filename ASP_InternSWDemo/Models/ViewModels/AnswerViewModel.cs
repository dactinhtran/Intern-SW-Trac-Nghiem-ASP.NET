using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels
{
    public class AnswerViewModel
    {
        public int AnswerId { get; set; }
        public string Answer { get; set; }
        public bool IsCorrect { get; set; }
        public int QuestionId { get; set; }
    }
}
