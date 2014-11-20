using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace COMP4952Medium.Models
{
    public class Item
    {
        [ScaffoldColumn(false)]
        public int ItemID { get; set; }

        public string ItemName { get; set; }

        public int ItemVelocity { get; set; }

        public string ItemImage { get; set; }

        public int? CategoryID { get; set; }

        public virtual Category Category { get; set; }
    }
}