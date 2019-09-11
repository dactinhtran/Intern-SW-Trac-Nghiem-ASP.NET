using Models.EF;
using Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using System.Data.SqlClient;

namespace Models.Dao
{
    public class ResultTableDao
    {
        InternDbContext context = null;
        public ResultTableDao()
        {
            context = new InternDbContext();
        }

        public IEnumerable<UserScoreViewModel> ListAllPaging()
        {
            var list = context.Database.SqlQuery<UserScoreViewModel>("ListAll_Score")
                .OrderByDescending(x => x.TestDate).ToList();
            return list;
        }
 
        public UserScoreViewModel InfoDetail(int? userId)
        {
            var list = context.Database.SqlQuery<UserScoreViewModel>("ListAll_Score").ToList();
            var res = list.FirstOrDefault(x => x.userId == userId);
            return res;
        }


        //get ds userId from UserScoreViewModel
        public int GetUserId(int? userId)
        {
            var list = context.Database.SqlQuery<UserScoreViewModel>("Get_Id_User").ToList();
            var res = list.Select(x=>x.userId).Where(x=>x == userId).FirstOrDefault();
            return res;
        }

        //tim kiem ket qua thi theo ngay
        public IEnumerable<UserScoreViewModel> SearchByDate(string dateStart, string dateFinish)
        {
            try
            {
                DateTime iplDateStart = DateTime.ParseExact(dateStart, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                DateTime iplDateFinish = DateTime.ParseExact(dateFinish, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                var model = context.Database.SqlQuery<UserScoreViewModel>("Search_By_Date @DateStart , @DateFinish",
                                       new SqlParameter("@DateStart", iplDateStart),
                                       new SqlParameter("@DateFinish", iplDateFinish)
                    );
                return model.OrderByDescending(x => x.TestDate).ToList();
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        //dem so user tham gia test theo ngay
        public int CountTestByDate(string dateStart, string dateFinish)
        {
            try
            {
                DateTime iplDateStart = DateTime.ParseExact(dateStart, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                DateTime iplDateFinish = DateTime.ParseExact(dateFinish, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                var count = context.Database.SqlQuery<int>("Count_Test_By_Date @DateStart , @DateFinish",
                                        new SqlParameter("@DateStart", iplDateStart),
                                        new SqlParameter("@DateFinish", iplDateFinish)).ToList<int>();
                return count[0];
            }
            catch(Exception ex)
            {
                return -1;
            }
            
        }

        //dem so user pass test trong khoang thoi gian
        public int CountTestPassByDate(string dateStart, string dateFinish)
        {
            try
            {
                DateTime iplDateStart = DateTime.ParseExact(dateStart, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                DateTime iplDateFinish = DateTime.ParseExact(dateFinish, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                var count = context.Database.SqlQuery<int>("Count_Test_Pass_By_Date @DateStart , @DateFinish",
                                        new SqlParameter("@DateStart", iplDateStart),
                                        new SqlParameter("@DateFinish", iplDateFinish)).ToList<int>();
                return count[0];
            }
            catch(Exception ex)
            {
                return -1;
            }
           
        }

        //so luong bai test(k theo time)
        public int SumTest()
        {
            return context.Scores.Count();
        }

        //so luong bai test pass(k theo time)
        public int sumTestPass()
        {
            var count = context.Scores.Where(x => x.Score1 >= 50).Count();
            return count;
        }

        //So % thi sinh pass/fail(sum)
        public Tuple<double, double> PercentPassFailTest()
        {
            double perPass = (double)sumTestPass() / (double)SumTest() * 100;

            double perPassRound =Math.Round(perPass, 2);
            double perFail = 100.0 - perPassRound;

            return Tuple.Create(perPassRound, perFail);
        }

        //So % user pass/fail trong khoang time
        public Tuple<double,double> PercentPassFailTestByDate(string dateStart, string dateFinish)
        {
            double perPass = (double)CountTestPassByDate(dateStart, dateFinish) / (double)CountTestByDate(dateStart, dateFinish) *100;
            double perPassRound =Math.Round(perPass, 2);
            double perFail = 100.0 - perPassRound;
            return Tuple.Create(perPassRound, perFail);
        }

        //display diem cua tung user
        public List<int> ScoreByUser(int? id)
        {
            var count = context.Database.SqlQuery<int>("Score_By_User @userId",
                                   new SqlParameter("@userId", id)).ToList();
            return count;
        }
        
        //so bai test cua moi user
        public int CountTest(int? id)
        {
            var count = context.Database.SqlQuery<int>("Count_Test @userId",
                                   new SqlParameter("@userId", id)).ToList();
            return count[0];
        }
    }
}
