using Models.EF;
using Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class QuestionModel
    {
        private InternDbContext context = null;
        public QuestionModel()
        {
            context = new InternDbContext();
        }

        //Hien thi ngau nhien 10 cau hỏi
        public List<Question> ListAll(int? topicId)
        {
            var take = 10;
            var questionsId = context.Questions
                .Where(q => q.TopicId == topicId)
                .Select(q => q.QuestionId)
                .OrderBy(i => i)
                .ToList();

            var rd = new Random();

            var randomIds = new List<int>();
            questionsId.Count();
            foreach (var id in questionsId)
            {
                var selectedId = rd.Next(questionsId.Min(), questionsId.Max() + 1);
                while (randomIds.Contains(selectedId) || !questionsId.Contains(selectedId))
                {
                    selectedId = rd.Next(questionsId.Min(), questionsId.Max() + 1);
                }
                randomIds.Add(selectedId);

                if (randomIds.Count >= take)
                    break;
            }
            var list = context.Questions
                            .Include(q => q.Answers)
                             .Where(q => randomIds.Contains(q.QuestionId) && q.TopicId == topicId)
                            .ToList();
            return list;
        }

        // tinh diem cho 10 cau hoi
        public TestResultViewModel ScoreCalculate(List<SubmitResultViewModel> model)
        {
            // lay tat ca id cua cau hoi
            var questionsId = model.Select(q => q.QuestionId).ToList();

            // lay tat ca cau hoi va cau tl dung' cua cau hoi do trong DB.
            var questionsContext = context.Questions
                .Where(q => questionsId.Contains(q.QuestionId))
                .Select(q => new
                {
                    QuestionId = q.QuestionId,
                    CorrectAns = q.Answers.FirstOrDefault(a => a.IsCorrect.HasValue && a.IsCorrect.Value).AnswerId
                })
                .ToList();
            // doi' chieu' cau tl cua? user voi' cau tl dung' in DB.
            var correctAnsNumber = model
                .Count(a => questionsContext.Any(a2 => a.QuestionId == a2.QuestionId && a.FinalAnswerId == a2.CorrectAns));

            return new TestResultViewModel()
            {
                CorrectAnswerNumber = correctAnsNumber,
                Score = (correctAnsNumber * 10),
                TotalQuestion = questionsId.Count,
                Detail = correctAnsNumber >= 5 ? "Đạt" : "Không đạt",
            };
        }

        public bool SaveTestResult(TestResultViewModel testResult, int userId, int? topicId)
        {
            context.Scores.Add(new Score()
            {
                Detail = testResult.Detail,
                Score1 = testResult.Score,
                TestDate = DateTime.Now,
                TopicId = topicId,
                UserId = userId
            });
            return context.SaveChanges() > 0;
        }

        public bool SaveQuesScore(List<SubmitResultViewModel> quesScores, int userId)
        {
            var quesScoreItem = quesScores.Select(q => new Ques_Score()
            {
                UserId = userId,
                QuestionId = q.QuestionId,
                AnswerId = q.FinalAnswerId,
            });


            var oldQuesScores = context.Ques_Score.Where(q => q.UserId == userId).ToList();
            context.Ques_Score.RemoveRange(oldQuesScores);
            foreach (var item in quesScoreItem)
            {
                if (item.AnswerId != 0)
                    context.Ques_Score.Add(item);
            }
            return context.SaveChanges() > 0;
        }


        //get answer from question
        public IEnumerable<AnswerViewModel> litsAnswer(int? id)
        {
            SqlCommand command = new SqlCommand();
            SqlParameter unitsParam = command.Parameters.AddWithValue("@questionId", id);
            if(id== null)
            {
                unitsParam.Value = DBNull.Value;
            }
            command.Parameters.Clear();
            var list = context.Database.SqlQuery<AnswerViewModel>("Get_Answer_By_Question @questionId", unitsParam);
            return list.ToList();
        }

        public bool SaveQuesAns(QuesAnsViewModel model)
        {
            try
            {
                if(!context.Questions.Any(x=> string.Equals(x.QuestionName,model.QuestionName,StringComparison.CurrentCultureIgnoreCase)))
                {
                    context.Questions.Add(new Question
                    {
                        QuestionName = model.QuestionName,
                        TopicId = model.Ques.TopicId
                    });
                    context.SaveChanges();
                    model.QuestionId = context.Questions.Max(x => x.QuestionId);
                    foreach (var item in model.ListAns)
                    {
                        context.Answers.Add(new Answer
                        {
                            QuestionId = model.QuestionId,
                            Answer1 = item.Ans,
                            IsCorrect = item.IsCorrect
                        });
                        context.SaveChanges();
                    }
                    return true;
                }
                return false;
            }
            catch(Exception ex)
            {
                return false;
            }
            
        }


    }
}
