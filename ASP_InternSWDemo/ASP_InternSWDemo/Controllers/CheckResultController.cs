using ASP_InternSWDemo.code;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_InternSWDemo.Controllers
{
    public class CheckResultController : BaseController
    {
        [HttpGet]
        // GET: Question
        public ActionResult Index()
        {
            var userId = int.Parse(TempData["UserId"].ToString());
            ViewBag.UserId = userId;
            var iplQues = new QuesScoreModel();
            var model = iplQues.ListAll(userId);
            return View(model); 
        }
      
    }
}