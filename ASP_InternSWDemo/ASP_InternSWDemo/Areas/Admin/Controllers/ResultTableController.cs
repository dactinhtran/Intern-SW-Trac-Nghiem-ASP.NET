using ASP_InternSWDemo.Areas.Admin.Common;
using ASP_InternSWDemo.code;
using Models;
using Models.Dao;
using Models.EF;
using Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ASP_InternSWDemo.Areas.Admin.Controllers
{
    public class ResultTableController : BaseController
    {
        // GET: Admin/ResultTable
        [HasCredential(RoleID = "LOOKUP_RES")]
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var iplScore = new ResultTableDao();

            var model = iplScore.ListAllPaging();
            var sumTest = iplScore.SumTest();
            var sumTestPass = iplScore.sumTestPass();
            var perModel = iplScore.PercentPassFailTest();
            var perPass = perModel.Item1;
            var perFail = perModel.Item2;

            ViewBag.CountUser = sumTest;
            ViewBag.UserPass = sumTestPass;
            ViewBag.PercentPass = perPass;
            ViewBag.PercentFail = perFail;

            return View(model);
        }

        [HasCredential(RoleID = "LOOKUP_RES")]
        public ActionResult Submit(string dateStart, string dateFinish, int page=1, int pageSize=10)
        {
            var iplResult = new ResultTableDao();
            var dao = iplResult.SearchByDate(dateStart, dateFinish);
            var countTest = iplResult.CountTestByDate(dateStart, dateFinish);
            var countTestPass = iplResult.CountTestPassByDate(dateStart, dateFinish);

            var perModel = iplResult.PercentPassFailTestByDate(dateStart, dateFinish);
            var perPass = perModel.Item1;
            var perFail = perModel.Item2;

            ViewBag.CountUser = countTest;
            ViewBag.UserPass = countTestPass;
            ViewBag.PercentPass = perPass;
            ViewBag.PercentFail = perFail;


            if (dao != null)
                return View("Index", dao);
            else
                return PartialView("_PageErr");
        }

        //display diem cua tung thi sinh(chartline)
        public ActionResult DisplayScoreByUser(int? userId)
        {
            var iplResultTable = new ResultTableDao();
            var model = iplResultTable.InfoDetail(userId);
            var countTest = iplResultTable.CountTest(userId);
            ViewBag.CountTest = countTest;
            var listScore = new ResultTableDao().ScoreByUser(userId);
            int[] arrScore = listScore.ToArray();
            ViewData["ListScore"] = arrScore;
            if (model != null)
                return View("DisplayScoreByUser",model);
            else
                return View();
        }
    }
}