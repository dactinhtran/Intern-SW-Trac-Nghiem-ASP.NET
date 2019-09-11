using ASP_InternSWDemo.Areas.Admin.Common;
using Models;
using Models.Dao;
using Models.EF;
using System.Web.Mvc;

namespace ASP_InternSWDemo.Areas.Admin.Controllers
{
    public class AnswerController : BaseController
    {
        // GET: Admin/Answer
        [HasCredential(RoleID = "VIEW_ANS")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new AnswerDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HasCredential(RoleID = "ADD_ANS")]
        [HttpGet]
        public ActionResult Create(int? questionId)
        {
            SetViewBag();
            return View();
        }

        [HasCredential(RoleID = "ADD_ANS")]
        [HttpPost] //form dc post len
        public ActionResult Create(Answer ans)
        {
            if (ModelState.IsValid)
            {
                var dao = new AnswerDao();
                long id = dao.Insert(ans);
                if (id > 0)
                {
                    SetAlert("Thêm thành công", "success");
                    return RedirectToAction("Edit", "Question", new { id = ans.QuestionId });
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thất bại");
                }
            }
            SetViewBag();
            return View("Index");
        }


        [HttpGet]
        [HasCredential(RoleID = "EDIT_ANS")]
        public ActionResult Edit(int? id)
        {
            SetViewBag();
            var model = new AnswerDao().getById(id);
            return View(model);
        }

        [HttpPost] //form dc post len
        [HasCredential(RoleID = "EDIT_ANS")]
        public ActionResult Edit(Answer ans)
        {
            if (ModelState.IsValid)
            {
                var dao = new AnswerDao();
                var res = dao.Update(ans);
                if (res)
                {
                    SetAlert("Sửa thành công", "success");
                    return RedirectToAction("Edit", "Answer", ans.AnswerId);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhập thất bại");
                }
            }
            return View("Index");
        }

        [HttpDelete]
        [HasCredential(RoleID = "DELETE_ANS")]
        public ActionResult Delete(int id)
        {
            new AnswerDao().Delete(id);
            return RedirectToAction("Index");
        }

        public void SetViewBag(long? selectedId = null) //hien thi danh sach cac question bang dropdowlist
        {
            var dao = new QuestionDao();
            ViewBag.QuestionId = new SelectList(dao.ListAll(), "QuestionId", "QuestionName", selectedId);
        }

    }
}