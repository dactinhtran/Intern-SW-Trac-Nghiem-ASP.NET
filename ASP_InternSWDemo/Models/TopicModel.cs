using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class TopicModel
    {
        private InternDbContext context = null;
        public TopicModel()
        {
            context = new InternDbContext();
        }
        //Hien thi toan bo danh sach cac topic
        public List<Topic> ListAll()
        {
            var list = context.Database.SqlQuery<Topic>("Sp_Topic_ListAll").ToList();
            return list;
        }
        
    }
}
