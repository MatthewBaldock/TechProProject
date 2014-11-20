using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace COMP4952Medium.Models
{
    public class ItemDatabaseInitializer : DropCreateDatabaseAlways<ItemContext>
    {
        protected override void Seed(ItemContext context)
        {
            GetCategories().ForEach(c => context.Categories.Add(c));
            GetItems().ForEach(p => context.Items.Add(p));
        }

        private static List<Category> GetCategories()
        {
            var categories = new List<Category>
            {
                new Category
                {
                    CategoryID = 1,
                    CategoryName = "Terran Republic",
                    CategoryAltName = "tr"
                },
                new Category
                {
                    CategoryID = 2,
                    CategoryName = "New Conglomerate",
                    CategoryAltName = "nc"
                },
                new Category
                {
                    CategoryID = 3,
                    CategoryName = "Vanu Soverignty",
                    CategoryAltName = "vs"
                },
                new Category
                {
                    CategoryID = 4,
                    CategoryName = "Nanite Systems",
                    CategoryAltName = "ns"
                }
            };

            return categories;
        }

        private static List<Item> GetItems()
        {
            var items = new List<Item>
            {
                new Item
                {
                    ItemID = 1,
                    ItemName = "P2-120 HEAT",
                    ItemVelocity = 225,
                    ItemImage = "P2-120_HEAT.png",
                    CategoryID = 1
                },
                new Item
                {
                    ItemID = 2,
                    ItemName = "P2-120 AP",
                    ItemVelocity = 250,
                    ItemImage = "P2-120_AP.png",
                    CategoryID = 1
                },
                new Item
                {
                    ItemID = 3,
                    ItemName = "P2-120 HE",
                    ItemVelocity = 175,
                    ItemImage = "P2-120_HE.png",
                    CategoryID = 1
                },
                new Item
                {
                    ItemID = 4,
                    ItemName = "G30 Vulcan",
                    ItemVelocity = 300,
                    ItemImage = "G30_Vulcan.png",
                    CategoryID = 1
                },
                new Item
                {
                    ItemID = 5,
                    ItemName = "P525 Marauder",
                    ItemVelocity = 175,
                    ItemImage = "P525_Marauder.png",
                    CategoryID = 1
                },
                new Item
                {
                    ItemID = 6,
                    ItemName = "Titan-150 HEAT",
                    ItemVelocity = 250,
                    ItemImage = "Titan-150_HEAT.png",
                    CategoryID = 2
                },
                new Item
                {
                    ItemID = 7,
                    ItemName = "Titan-150 AP",
                    ItemVelocity = 275,
                    ItemImage = "Titan-150_AP.png",
                    CategoryID = 2
                },
                new Item
                {
                    ItemID = 8,
                    ItemName = "Titan-150 HE",
                    ItemVelocity = 175,
                    ItemImage = "Titan-150_HE.png",
                    CategoryID = 2
                },
                new Item
                {
                    ItemID = 9,
                    ItemName = "Enforcer ML85",
                    ItemVelocity = 300,
                    ItemImage = "Enforcer_ML85.png",
                    CategoryID = 2
                },
                new Item
                {
                    ItemID = 10,
                    ItemName = "C85 Canister",
                    ItemVelocity = 400,
                    ItemImage = "C85_Canister.png",
                    CategoryID = 2
                },
                new Item
                {
                    ItemID = 11,
                    ItemName = "Supernova PC",
                    ItemVelocity = 200,
                    ItemImage = "Supernova_PC.png",
                    CategoryID = 3
                },
                new Item
                {
                    ItemID = 12,
                    ItemName = "Supernova FPC",
                    ItemVelocity = 225,
                    ItemImage = "Supernova_FPC.png",
                    CategoryID = 3
                },
                new Item
                {
                    ItemID = 13,
                    ItemName = "Supernova VPC",
                    ItemVelocity = 175,
                    ItemImage = "Supernova_VPC.png",
                    CategoryID = 3
                },
                new Item
                {
                    ItemID = 14,
                    ItemName = "Proton II PPA",
                    ItemVelocity = 150,
                    ItemImage = "Proton_II_PPA.png",
                    CategoryID = 3
                },
                new Item
                {
                    ItemID = 15,
                    ItemName = "Saron HRB",
                    ItemVelocity = 300,
                    ItemImage = "Saron_HRB.png",
                    CategoryID = 3
                },
                new Item
                {
                    ItemID = 16,
                    ItemName = "M20 Basilisk",
                    ItemVelocity = 550,
                    ItemImage = "M20_Basilisk.png",
                    CategoryID = 4
                },
                new Item
                {
                    ItemID = 17,
                    ItemName = "G30 Walker",
                    ItemVelocity = 1000,
                    ItemImage = "G30_Walker.png",
                    CategoryID = 4
                },
                new Item
                {
                    ItemID = 18,
                    ItemName = "G40-F Ranger",
                    ItemVelocity = 325,
                    ItemImage = "G40-F_Ranger.png",
                    CategoryID = 4
                },
                new Item
                {
                    ItemID = 19,
                    ItemName = "M12 Kobalt",
                    ItemVelocity = 650,
                    ItemImage = "M12_Kobalt.png",
                    CategoryID = 4
                },
                new Item
                {
                    ItemID = 20,
                    ItemName = "E540 Halbred",
                    ItemVelocity = 275,
                    ItemImage = "E540_Halbred.png",
                    CategoryID = 4
                },
            };
            return items;
        }
    }
}