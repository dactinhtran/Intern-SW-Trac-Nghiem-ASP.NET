using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
namespace Models.Dao
{
    public class AnswerDao
    {
        InternDbContext context = null;
        public AnswerDao()
        {
            context = new InternDbContext();
        }



        public long Insert(Answer ans)//them moi ban ghi
        {
            context.Answers.Add(ans);
            context.SaveChanges();
            return ans.AnswerId;
        }

        public IEnumerable<Answer> ListAllPaging(string searchString, int page, int pageSize)//phan trang
        {
            IQueryable<Answer> model = context.Answers;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Answer1.Contains(searchString));
            }
            return model.OrderBy(x => x.AnswerId).ToPagedList(page, pageSize);
        }

        public Answer getById(int? id)
        {
            return context.Answers.Find(id); // khoa chinh
        }

        public bool Update(Answer ans)
        {
            try
            {
                var model = context.Answers.Find(ans.AnswerId);
                model.Answer1 = ans.Answer1;
                model.IsCorrect = ans.IsCorrect;
                model.QuestionId = ans.QuestionId;
                return context.SaveChanges() > 0;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public bool Delete(int id)
        {
            var ans = context.Answers.Find(id);
            context.Answers.Remove(ans);
            return context.SaveChanges() > 0;
        }
    }
}
