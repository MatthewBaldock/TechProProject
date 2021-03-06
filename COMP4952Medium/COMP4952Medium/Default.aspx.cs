﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COMP4952Medium.Models;
using System.Web.ModelBinding;
using System.Web.Security;
using Microsoft.AspNet.Identity;



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


        public IQueryable<Item> GetItemTR()
        {
            var _db = new COMP4952Medium.Models.ItemContext();
            IQueryable<Item> query = _db.Items;
            
            query = query.Where(p => p.CategoryID == 1);
            
            return query;
        }

        public IQueryable<Item> GetItemNC()
        {
            var _db = new COMP4952Medium.Models.ItemContext();
            IQueryable<Item> query = _db.Items;

            query = query.Where(p => p.CategoryID == 2);

            return query;
        }

        public IQueryable<Item> GetItemVS()
        {
            var _db = new COMP4952Medium.Models.ItemContext();
            IQueryable<Item> query = _db.Items;

            query = query.Where(p => p.CategoryID == 3);

            return query;
        }

        public IQueryable<Item> GetItemNS()
        {
            var _db = new COMP4952Medium.Models.ItemContext();
            IQueryable<Item> query = _db.Items;

            query = query.Where(p => p.CategoryID == 4);

            return query;
        }

       public void Save_Click(object sener, EventArgs e)
       {
          Graph newGraph = new Graph()
          {
              UserID = User.Identity.GetUserId(),
              ItemVelocity = Velocity1.Text,
              Range = range.Text,
              Height = Height.Text
             
          };
           
       }

     
    }
}