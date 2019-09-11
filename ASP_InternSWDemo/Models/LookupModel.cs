using Models.EF;
using Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class LookupModel
    {
        InternDbContext context = null;
        public LookupModel()
        {
            context = new InternDbContext();
        }

        public List<UserScoreViewModel> myListScore(int? userId)
        {
            object[] param =
            {
                new SqlParameter("@userId",userId)
            };
            var list = context.Database.SqlQuery<UserScoreViewModel>("Sp_Lookup @userId", param).ToList();
            return list;
        }
    }
}
