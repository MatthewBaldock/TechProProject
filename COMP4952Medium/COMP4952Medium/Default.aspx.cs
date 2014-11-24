using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COMP4952Medium.Models;
using System.Web.ModelBinding;
using System.Web.Security;

namespace COMP4952Medium
{
    public partial class _Default : Page
    {
        private bool loadOnce = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string GetActive() 
        {
            if (loadOnce)
            {
                loadOnce = false;
                return "in active";
            }
            return "";
        }

        public IQueryable<Category> GetCategories()
        {
            var _db = new COMP4952Medium.Models.ItemContext();
            IQueryable<Category> query = _db.Categories;
            return query;
        }

        public IQueryable<Item> GetItems([Control("CategoryID")] int itemID)
        {
            var _db = new COMP4952Medium.Models.ItemContext();
            IQueryable<Item> query = _db.Items;

            query = query.Where(p => p.CategoryID == itemID);

            return query;
        }
    }
}