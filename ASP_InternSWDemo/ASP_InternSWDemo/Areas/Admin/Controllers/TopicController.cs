using ASP_InternSWDemo.Areas.Admin.Common;
using Models.Dao;
using Models.EF;
using System.Web.Mvc;
namespace ASP_InternSWDemo.Areas.Admin.Controllers
{
    public class TopicController : BaseController
    {
        // GET: Admin/Topic
        [HasCredential(RoleID = "VIEW_TOPIC")]
        public ActionResult Index()
        {
            var iplTopic = new TopicDao();
            var model = iplTopic.ListAll();
            return View(model);
        }

        [HttpGet] //tai giao dien
        [HasCredential(RoleID = "ADD_TOPIC")]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost] //form dc post len
        [HasCredential(RoleID = "ADD_TOPIC")]
        public ActionResult Create(Topic topic)
        {
            if (ModelState.IsValid)
            {
                var dao = new TopicDao();
                long id = dao.Insert(topic);
                if (id > 0)
                {
                    SetAlert("Thêm thành công", "success");
                    return RedirectToAction("Index", "Topic");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thất bại");
                }
            }
            return View("Index");
        }

        [HttpDelete]
        [HasCredential(RoleID = "DELETE_TOPIC")]
        public ActionResult Delete(int id)
        {
            new TopicDao().Delete(id);
            SetAlert("Xóa tài khoản thành công", "success");
            return RedirectToAction("Index");
        }
    }
}