using ASP_InternSWDemo.Areas.Admin.Common;
using ASP_InternSWDemo.Areas.Admin.Models;
using Models.Dao;
using System.Web.Mvc;

namespace ASP_InternSWDemo.Areas.Admin.Controllers
{
    public class AdminLoginController : Controller
    {
        // GET: Admin/Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new AdminDao();
                var res = dao.Login(model.UserName, model.Password,true);
                if (res == 1)
                {
                    var admin = dao.getByUserName(model.UserName);
                    var adminSession = new AdminLogin();
                    adminSession.UserName = admin.UserName;
                    adminSession.AdminId = admin.ID;
                    adminSession.GroupID = admin.GroupID;
                    var listCredentials = dao.GetListCredential(model.UserName); //trong bang Credential add Serializeable de k err
                    Session.Add(CommonConstants.SESSION_CREDENTIALS, listCredentials);
                    Session.Add(CommonConstants.ADMIN_SESSION, adminSession);

                    return RedirectToAction("Index", "Home");
                }
                else if (res == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (res == -1)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn đã bị khóa.");
                }
                else if (res == -2)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn không được phép truy cập.");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng.");
                }
            }
            return View("Index");
        }
    }
}