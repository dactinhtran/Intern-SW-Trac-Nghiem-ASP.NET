using Models;
using Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_InternSWDemo.Controllers
{
    public class TopicController : BaseController
    {
        // GET: Topic
        [HttpGet]
        public ActionResult Index(int? id)
        {
            id = (Int32)Session["UserId"];
            var iplTopic = new TopicModel();
            TopicUserViewModel vm = new TopicUserViewModel();
            vm.allTopic = iplTopic.ListAll();
            var iplUser = new UserModel();
            vm.allUser = iplUser.getById(id);
            return View(vm);
        }
    }
}