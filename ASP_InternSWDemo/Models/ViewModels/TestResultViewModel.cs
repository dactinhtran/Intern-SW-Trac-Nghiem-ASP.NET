using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels
{
    public class TestResultViewModel
    {
        public int CorrectAnswerNumber { get; set; }
        public int Score { get; set; }
        public int TotalQuestion { get; set; }
        public string Detail { get; set;}
    }
}
