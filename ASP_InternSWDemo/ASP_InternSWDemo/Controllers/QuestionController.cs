using ASP_InternSWDemo.code;
using Models;
using Models.EF;
using Models.ViewModels;
using System.Collections.Generic;
using System.Web.Mvc;
using System;
namespace ASP_InternSWDemo.Controllers
{
    public class QuestionController : Controller
    {
        [HttpGet]
        // GET: Question
        public ActionResult Index(int? id)
        {
            //var user = new UserSession();
            //user = (UserSession)Session[SessionHelper.USER_SESSION];
            
            ViewBag.TopicId = id;
            TempData["TopicId"] = id;
            var iplQues = new QuestionModel();
            var model = iplQues.ListAll(id);
            return View(model); //truyen dl thong qua model
        }
        [HttpPost]
        public ActionResult Submit(List<SubmitResultViewModel> model, Score score, int topicId)
        {

            var userId = Session["UserId"];
            var iplQues = new QuestionModel();
            var points = iplQues.ScoreCalculate(model);

            TempData["UserId"] = userId;
            if (iplQues.SaveTestResult(points, (int)userId, topicId) && iplQues.SaveQuesScore(model,(int)userId))
            {
                return RedirectToAction("Index", "Score",points);
            }
            else
                return RedirectToAction("Index", new { id = topicId });
        }
    }
}