using Models.EF;
using PagedList;
using System.Collections.Generic;
using System.Linq;

namespace Models.Dao
{
    public class UserDao
    {
        InternDbContext context = null;
        public UserDao()
        {
            context = new InternDbContext();
        }

        public IEnumerable<User> ListAllPaging( int page, int pageSize)//phan trang
        {
            var list = context.Database.SqlQuery<User>("List_User").OrderBy(x => x.Name).ToPagedList(page, pageSize);
            return list;
        }
    }
}
