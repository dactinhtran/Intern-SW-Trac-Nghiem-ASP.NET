using ASP_InternSWDemo.code;
using Models;
using Models.EF;
using Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_InternSWDemo.Controllers
{
    public class ScoreController : BaseController
    {
        // GET: Score
        public ActionResult Index(TestResultViewModel model)
        {
            ViewBag.UserId = Session["UserId"];
            return View(model);
        }
         [HttpPost]
        public ActionResult Submit()
        {
            var userId = Request.Params["UserId"];
            TempData["UserId"] = userId;
            return RedirectToAction("Index", "CheckResult");
        }
    }
}