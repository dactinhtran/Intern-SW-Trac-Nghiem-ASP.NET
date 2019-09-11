using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_InternSWDemo.code
{
    [Serializable]
    //luu cac thong tin session, co the co 1 hoac nhieu cac field
    public class UserSession 
    {
        public long UserId { set; get; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
    }
}