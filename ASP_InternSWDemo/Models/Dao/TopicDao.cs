using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Dao
{
    public class TopicDao
    {
        InternDbContext context = null;
        public TopicDao()
        {
            context = new InternDbContext();
        }
            
        public List<Topic> ListAll()
        {
            var list = context.Database.SqlQuery<Topic>("Sp_Topic_ListAll").ToList();          
            return list;
        }

        public long Insert(Topic topic)//them moi ban ghi
        {
            context.Topics.Add(topic);
            context.SaveChanges();
            return topic.TopicId;
        }

        public bool Delete(int id)
        {
            var user = context.Topics.Find(id);
            context.Topics.Remove(user);
            return context.SaveChanges() > 0;
        }
    }
}
