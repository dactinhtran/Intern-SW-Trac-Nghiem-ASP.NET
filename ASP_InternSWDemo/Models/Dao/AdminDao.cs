using Models.EF;
using System.Collections.Generic;
using System.Linq;
using PagedList;
using Models.Common;
using System;

namespace Models.Dao
{
    public class AdminDao
    {
        InternDbContext context = null;
        public AdminDao()
        {
            context = new InternDbContext();
        }

        public long Insert(AdminUser admin)//them moi ban ghi
        {
            context.AdminUsers.Add(admin);
            context.SaveChanges();
            return admin.ID;
        }

        public IEnumerable<AdminUser> ListAllPaging(string searchString,int page, int pageSize)//phan trang
        {
            IQueryable<AdminUser> model = context.AdminUsers;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.UserName).ToPagedList(page,pageSize);
        }

        public AdminUser getByUserName(string userName)//lay ra userName
        {
            return context.AdminUsers.SingleOrDefault(x => x.UserName == userName);
        }

        public bool ChangeStatus(long id)
        {
            var admin = context.AdminUsers.Find(id);
            admin.Status = !admin.Status;
            context.SaveChanges();
            return admin.Status;
        }

        public AdminUser getById(int? id)
        {
            return context.AdminUsers.Find(id); // khoa chinh
        }

        public bool Update(AdminUser admin)
        {
            var user = context.AdminUsers.Find(admin.ID);
            user.Name = admin.Name;
            user.Address = admin.Address;
            user.Email = admin.Email;
            user.Phone = admin.Phone;
            return context.SaveChanges() > 0;
        }

        public List<string> GetListCredential(string userName)
        {
            var user = context.AdminUsers.Single(x => x.UserName == userName);
            var data = (from a in context.Credentials
                        join b in context.UserGroups on a.UserGroupID equals b.ID
                        join c in context.Roles on a.RoleID equals c.RoleID
                        where b.ID == user.GroupID
                        select new  
                        {
                            a.RoleID,
                            a.UserGroupID
                        }).AsEnumerable().Select(x => new Credential()
                        {
                            RoleID = x.RoleID,
                            UserGroupID = x.UserGroupID 
                        });
            return data.Select(x => x.RoleID).ToList();
         }

        public static bool LoginAdmin(string userName, string password)
        {
            using (InternDbContext context = new InternDbContext())
            {
                return context.AdminUsers.Any(user => user.UserName.Equals(userName,
                    StringComparison.OrdinalIgnoreCase) && user.Password == password);
            }
        }

        public int Login(string userName, string pwd,bool isLoginAdmin = false) //Kiem tra login
        {
            var res = context.AdminUsers.SingleOrDefault(x => x.UserName == userName);
            if (res == null)
            {
                return 0;
            }
            else
            {
                if (isLoginAdmin == true)
                {
                    if (res.GroupID == CommonConstants.ADMIN_GROUP || res.GroupID == CommonConstants.MOD_GROUP)
                    {
                        if (res.Status == true)
                        {
                            if (res.Password == pwd)
                                return 1;
                        }
                        else return -1;

                    }
                    else return -2;
                }               
            }
            return -3;
        }
        
        public List<AdminUser> listAll()
        {
            return context.AdminUsers.ToList();
        }
        public void CommitName(AdminUser user)
        {
            var model = context.AdminUsers.Find(user.ID);
            model.Name = user.Name;
            context.SaveChanges();
        }
        public bool Delete(int id)
        {
            var user = context.AdminUsers.Find(id);
            context.AdminUsers.Remove(user);
            return context.SaveChanges() > 0;
        }
    }
}
