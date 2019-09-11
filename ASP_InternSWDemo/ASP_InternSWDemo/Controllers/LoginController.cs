using ASP_InternSWDemo.code;
using ASP_InternSWDemo.Models;
using Facebook;
using Models;
using Models.EF;
using Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace ASP_InternSWDemo.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoginFacebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email",
            });
            return Redirect(loginUrl.AbsoluteUri);
        }

        public ActionResult FacebookCallback(string code, UserViewModel model)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                code = code
            });
            var accessToken = result.access_token;
            if (!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken = accessToken;
                dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
                string email = me.email;
                string userName = me.first_name + " "+ me.middle_name+ " " + me.last_name;
                string firstName = me.first_name;
                string middleName = me.middle_name;
                string lastName = me.last_name;

                model.Email = email;
                model.Name = userName;
                var dao = new UserModel();
                var iplUser = new UserModel();
                if (dao.checkInfo(model.Name, model.Email) == true)
                {
                    var obUser = iplUser.AddUser(model);
                }
                var user = dao.getByUser(model.Name, model.Email);
                var userSession = new UserSession();
                userSession.Name = user.Name;
                userSession.UserId = user.UserId;
                Session["UserId"] = user.UserId;
                Session.Add(SessionHelper.USER_SESSION, userSession);
                return RedirectToAction("Index", "Topic");

            }
            return RedirectToAction("Index", "Topic");
        }

        [HttpPost]       
        public ActionResult Login(UserViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (model.Name is null || model.Email is null || model.Phone is null)
                    ModelState.AddModelError("", "Vui lòng nhập đầy đủ thông tin");
                else
                {
                    var dao = new UserModel(); 
                    if (dao.checkInfo(model.Name, model.Email) == true)
                    {
                        var obUser = dao.AddUser(model);
                    }
                    var user = dao.getByUser(model.Name, model.Email);
                    var userSession = new UserSession();
                    userSession.Name = user.Name;
                    userSession.UserId = user.UserId;
                    Session["UserId"] = user.UserId;
                    Session.Add(SessionHelper.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Topic");
                }
            }
            return View("Index");
        }
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            Session.Abandon(); // it will clear the session at the end of request
            return RedirectToAction("Index", "Login");
        }
    }
}