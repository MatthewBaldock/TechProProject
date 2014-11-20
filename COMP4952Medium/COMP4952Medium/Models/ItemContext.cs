using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace COMP4952Medium.Models
{
    public class ItemContext : DbContext
    {
        public ItemContext()
            : base("COMP4952Medium") { }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Item> Items { get; set; }
    }
}