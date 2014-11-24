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
        public int UserID { get; set; }
        public string ItemName { get; set; }

        public int? ItemVelocity { get; set; }

        public int? CategoryID { get; set; }

        public int? Angle { get; set; }

        public int? Range { get; set; }

        public int? Height { get; set; }

    }
}