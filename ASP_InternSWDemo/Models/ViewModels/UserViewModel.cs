using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels
{


    public class UserViewModel
    {
        public string Name { get; set; }
        public string Email { set; get; }
        public string Phone { set; get; }
    }
}
