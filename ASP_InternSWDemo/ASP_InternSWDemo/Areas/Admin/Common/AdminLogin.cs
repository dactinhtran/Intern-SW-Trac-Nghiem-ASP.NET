using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_InternSWDemo.Areas.Admin.Common
{
    [Serializable]
    public class AdminLogin
    {
        public long AdminId { get; set; }
        public string UserName { get; set; }
        public string GroupID { get; set; }
    }
}