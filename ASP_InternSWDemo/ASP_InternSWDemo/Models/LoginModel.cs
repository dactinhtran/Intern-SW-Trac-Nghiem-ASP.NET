using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ASP_InternSWDemo.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Bạn phải nhập họ tên")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Bạn phải nhập email")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Bạn phải nhập số điện thoại")]
        public string Phone { get; set; }
    }
} 