using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_InternSWDemo.ViewModels.Response
{
    //get QuestionId and FinalAnswer để xử lý kết quả
    public class SubmitItemViewModel
    {
        public int QuestionId { get; set; }
        public int FinalAnswer { get; set; }
    }
}