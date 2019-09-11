using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels
{
    public class TopicUserViewModel
    {
        public List<Topic> allTopic { get; set; }
        public User allUser { get; set; }
    }
}
