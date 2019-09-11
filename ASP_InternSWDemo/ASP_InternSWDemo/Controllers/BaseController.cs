using ASP_InternSWDemo.code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ASP_InternSWDemo.Controllers
{
    public class BaseController : Controller
    {
        // GET: Base
        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var session = (UserSession)Session[SessionHelper.USER_SESSION];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(
                new { controller = "Login", action = "Index"}));
            }
            base.OnActionExecuted(filterContext);
        }   
    }
}