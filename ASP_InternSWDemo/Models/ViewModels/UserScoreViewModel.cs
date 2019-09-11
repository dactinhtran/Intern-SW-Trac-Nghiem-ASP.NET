using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Models.ViewModels
{
    public class UserScoreViewModel
    {
        public int userId { get; set; }

        public string Name { get; set; }

        public int Score { get; set; }

        public string TopicName { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime TestDate { get; set; }

        public string Email { get; set; }

        public string Phone { get; set; }
    }
}