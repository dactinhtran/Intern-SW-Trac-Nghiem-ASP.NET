using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
namespace Models.Dao
{
    public class QuestionDao
    {
        InternDbContext context = null;
        public QuestionDao()
        {
            context = new InternDbContext();
        }

        public List<Question> ListAll()
        {
            var list = context.Database.SqlQuery<Question>("Question_ListAll").ToList();
            return list;
        }

        public Question getById(int? id)
        {
            return context.Questions.Find(id);
        }

        //public bool Insert(Question ques)//them moi ban ghi
        //{
        //    if(ques.QuestionName != null && ques.TopicId != null)
        //    {
        //        context.Questions.Add(ques);
        //        context.SaveChanges();
        //        return true;
        //    }
        //    return false;
        //}

       
        public IEnumerable<Question> ListAllPaging(string searchString, int page, int pageSize)//phan trang
        {
            IQueryable<Question> model = context.Questions;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.QuestionName.Contains(searchString));
            }
            return model.OrderBy(x => x.TopicId).ToPagedList(page, pageSize);
        }

        public bool Update(Question ques)
        {
            var model = context.Questions.Find(ques.QuestionId);
            model.QuestionName = ques.QuestionName;
            model.TopicId = ques.TopicId;
            return context.SaveChanges() > 0;
        }

        public bool Delete(int id)
        {
            var ques = context.Questions.Find(id);
            context.Questions.Remove(ques);
            return context.SaveChanges() > 0;
        }
    }
}
