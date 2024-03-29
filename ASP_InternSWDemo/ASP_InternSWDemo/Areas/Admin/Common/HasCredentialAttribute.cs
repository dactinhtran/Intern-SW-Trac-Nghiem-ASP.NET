﻿using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
namespace ASP_InternSWDemo.Areas.Admin.Common
{
    public class HasCredentialAttribute : AuthorizeAttribute
    {
        public string RoleID { get; set; }
        //check session, kiem tra Credential
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {         
            var session = (AdminLogin)HttpContext.Current.Session[Common.CommonConstants.ADMIN_SESSION];
            if (session == null)
                return false;
            List<string> privilegeLevels = this.GetCredentialByLoggedInUser(session.UserName);

            if (privilegeLevels.Contains(this.RoleID) || session.GroupID == CommonConstants.ADMIN_GROUP )
                return true;
            else return false;
        }

        //thong bao loi neu khong dc cap quyen truy cap
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new ViewResult
            {
                ViewName = "~/Areas/Admin/Views/Shared/401.cshtml"
            };
        }

        //get credential
        private List<string> GetCredentialByLoggedInUser(string userName)
        {
            var credentials = (List<string>)HttpContext.Current.Session[Common.CommonConstants.SESSION_CREDENTIALS];
            return credentials;
        }
    }
}