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
    public class UserModel
    {
        private InternDbContext context = null;
        public UserModel()
        {
            context = new InternDbContext();
        }
        
        public bool AddUser(UserViewModel user)
        {
            context.Users.Add(new User
            {
                Name = user.Name,
                Email = user.Email,
                Phone = user.Phone
            });
            return context.SaveChanges() > 0;
        }

        public long InsertForFacebook(User user)
        {
            var res = context.Users.SingleOrDefault(x => x.Name == user.Name && x.Email == user.Email);
            if(res == null)
            {
                context.Users.Add(user);
                context.SaveChanges();
                return user.UserId;
            }
            else
            {
                return user.UserId;
            }
        }

        //get Name
        public User getByUser(string Name, string Email)
        {
            return context.Users.FirstOrDefault(x => x.Name == Name && x.Email == Email);
        }

        public bool checkInfo(string Name, string Email)
        {
            var res = context.Users.Count(x => x.Name == Name && x.Email == Email);
            if (res == 0)
                return true;
            return false;
        }
        //get id
        public User getById(int? id)
        {
            return context.Users.Find(id); // khoa chinh thi dung nhu nay ngan hon Single
        }
        
        public List<User> listAllUser()
        {
            return context.Users.ToList();
        }

    }
}
