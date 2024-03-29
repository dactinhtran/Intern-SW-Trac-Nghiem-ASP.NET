﻿
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Models.EF
{
    [Table("Credential")]
    [Serializable]
    public class Credential
    {    
        [Key]
        [StringLength(20)]
        public string UserGroupID { get; set; }

        [StringLength(50)]
        public string RoleID { get; set; }
    }
}
