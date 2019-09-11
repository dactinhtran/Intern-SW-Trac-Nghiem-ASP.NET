using Models.Dao;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using System.Web.Script.Serialization;
using ASP_InternSWDemo.Areas.Admin.Common;

namespace ASP_InternSWDemo.Areas.Admin.Controllers
{
    public class UserAdminController : BaseController
    {
        // GET: Admin/UserAdmin
        [HasCredential(RoleID ="VIEW_USER")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new AdminDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet] //tai giao dien
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost] //form dc post len
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create(AdminUser admin)
        {
            if (ModelState.IsValid)
            {
                var dao = new AdminDao();
                long id = dao.Insert(admin);
                if (id > 0)
                {
                    SetAlert("Thêm thành công", "success");
                    return RedirectToAction("Index", "UserAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm user thất bại");
                }
            }
            return View("Index");
        }

        //update name table AdminUser nhieu record
        public JsonResult Update(string userModel)
        {
            var jsonUser = new JavaScriptSerializer().Deserialize<List<AdminUser>>(userModel);
            var model = new AdminDao();
            var listUser = model.listAll();
            foreach (var item in listUser)
            {
                var jsonItem = jsonUser.SingleOrDefault(x => x.ID == item.ID);
                if (jsonItem != null)
                {
                    item.Name = jsonItem.Name;
                    SetAlert("Cập nhật thành công", "success");
                    model.CommitName(item);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thất bại");
                }
            }
            return Json(new
            {
                status = true
            });
        }
        [HttpGet]
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(int? id)
        {
            var model = new AdminDao().getById(id);
            return View(model);
        }

        [HttpPost] //form dc post len
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(AdminUser admin)
        {
            if (ModelState.IsValid)
            {
                var dao = new AdminDao();
                var res = dao.Update(admin);
                if (res)
                {
                    SetAlert("Sửa thông tin thành công", "success");
                    return RedirectToAction("Index", "UserAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật user thất bại");
                }
            }
            return View("Index");
        }

        [HttpDelete]
        [HasCredential(RoleID = "DELETE_USER")]
        public ActionResult Delete(int id)
        {
            new AdminDao().Delete(id);
            SetAlert("Xóa tài khoản thành công", "success");
            return RedirectToAction("Index");
        }

        [HttpPost]
        [HasCredential(RoleID = "EDIT_USER")]
        public JsonResult ChangeStatus(long id)
        {
            var res = new AdminDao().ChangeStatus(id);
            return Json(new
            {
                status = res
            });
        }
    }
}