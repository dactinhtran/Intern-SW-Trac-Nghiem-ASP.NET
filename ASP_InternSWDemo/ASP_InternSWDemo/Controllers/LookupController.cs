using ASP_InternSWDemo.code;
using Models;
using Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_InternSWDemo.Controllers
{
    public class LookupController : BaseController
    {

        [HttpGet]
        public ActionResult Index(int? id)
        {
            ViewBag.UserId = id;      
            var iplLookup = new LookupModel();
            var model = iplLookup.myListScore(id);
            return View(model);
        }
    }
}