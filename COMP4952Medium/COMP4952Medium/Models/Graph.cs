using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace COMP4952Medium.Models
{
    public class Graph
    {
        [ScaffoldColumn(false)]

        [Key]
        public string UserID { get; set; }

        public string ItemVelocity { get; set; }

        public string Range { get; set; }

        public string Height { get; set; }

    }
}