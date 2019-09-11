using System.Data.Entity;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.ViewModels;

namespace Models
{
    public class QuesScoreModel
    {
        private InternDbContext context = null;
        public QuesScoreModel()
        {
            context = new InternDbContext();
        }
        //hien thi 10 cau hoi da display khi user lam bai test
        public List<QuestionResultItem> ListAll(int? userId)
        {
            var list = context.Ques_Score
                            //.Include(q => q.Answer)
                            //.Include(q => q.Answer.Question)
                            .Where(q => q.UserId == userId)
                            .Select(q => new QuestionResultItem()
                            {
                                QuestionName = q.Answer.Question.QuestionName,
                                QuestionId = q.Answer.QuestionId.Value,
                                TopicId = q.Answer.Question.TopicId.Value,
                                AnswerName = q.Answer.Answer1,
                                AnswerId = q.AnswerId,
                                Answers = q.Answer.Question.Answers.Select(a=>new AnswerInfoItem()
                                {
                                    AnswerId = a.AnswerId,
                                    AnswerName = a.Answer1,
                                    IsCorrect = a.IsCorrect.Value
                                }).ToList()
                            })
                            .ToList();
            return list;
        }
    }
}
