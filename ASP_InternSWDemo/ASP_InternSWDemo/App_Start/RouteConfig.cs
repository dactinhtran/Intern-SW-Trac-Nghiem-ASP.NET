using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ASP_InternSWDemo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Bang ket qua thi",
                url: "Admin/UserAdmin/Index",
                defaults: new { controller ="ResultTable", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "ASP_InternSWDemo.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Login", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "ASP_InternSWDemo.Controllers" }
            );
        }
    }
}
