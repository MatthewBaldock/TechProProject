using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace COMP4952Medium.Models
{
    public class Category
    {
        [ScaffoldColumn(false)]
        public int CategoryID { get; set; }

        public string CategoryName { get; set; }

        public string CategoryAltName { get; set; }

        public virtual ICollection<Item> Items { get; set; }
    }
}