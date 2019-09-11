using Models.Dao;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using ASP_InternSWDemo.Areas.Admin.Common;
using Models;
using Models.ViewModels;

namespace ASP_InternSWDemo.Areas.Admin.Controllers
{
    public class QuestionController : BaseController
    {
        // GET: Admin/Question
        [HasCredential(RoleID = "VIEW_QUES")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new QuestionDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet] //tai giao dien
        [HasCredential(RoleID = "ADD_QUES")]
        public ActionResult CreateViewModel()
        {
            SetViewBag(); //tu hieu tham so == null
            return View();
        }

        [HasCredential(RoleID = "ADD_QUES")]
        [HttpPost] //form dc post len
        public ActionResult CreateViewModel(QuesAnsViewModel model)
        {
            if (ModelState.IsValid)
            {
                var itemQues = new QuestionModel().SaveQuesAns(model);
                if (itemQues)
                {
                    SetAlert("Thêm thành công", "success");
                    return RedirectToAction("Index", "Question");
                }
                else
                {
                    SetAlert("Thêm thất bại", "error");
                    return RedirectToAction("Index", "Question");
                }
            }
            SetViewBag();
            return Redirect("Index");
        }

        [HttpGet]
        [HasCredential(RoleID = "EDIT_QUES")]
        public ActionResult Edit(int? id)
        {
            SetViewBag();
            var model = new QuestionDao().getById(id);
            var list = new QuestionModel().litsAnswer(id);
            ViewData["ListAnswer"] = list;
            return View(model); 
        }


        [HttpPost] //form dc post len
        [HasCredential(RoleID = "EDIT_QUES")]
        public ActionResult Edit(Question ques)
        {
            if (ModelState.IsValid)
            {
                var dao = new QuestionDao();
                var res = dao.Update(ques);

                if (res)
                {
                    SetAlert("Sửa thành công", "success");
                    return RedirectToAction("Index", "Question");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thất bại");
                }
            }
            SetViewBag();
            return View("Index");
        }

        public void SetViewBag(long? selectedId = null) //hien thi danh sach cac topic bang dropdowlist
        {
            var dao = new TopicDao();
            var selectedItem = new List<SelectListItem>();
            foreach (var item in dao.ListAll())
            {
                selectedItem.Add(new SelectListItem
                {
                    Text = item.TopicName,
                    Value = item.TopicId.ToString()
                });
            }
            ViewBag.TopicId = new SelectList(selectedItem, "Value", "Text", selectedId);

        }

        [HttpDelete]
        [HasCredential(RoleID = "DELETE_QUES")]
        public ActionResult Delete(int id)
        {
            new QuestionDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}