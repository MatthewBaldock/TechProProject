using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Security.Claims;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Web.Services;

namespace COMP4952Medium.AdminPage
{
    public partial class Admin : System.Web.UI.Page
    {
        private UserManager<IdentityUser> manager;
        protected void Page_Load(object sender, EventArgs e)
        {
            Msg.Text = "";
            var userStore = new UserStore<IdentityUser>();
            manager = new UserManager<IdentityUser>(userStore);
            if (!User.IsInRole("Admin"))
            {
                Msg.Text = "You are not authorized to view user roles.";
                rptrUsers.Visible = false;
                return;
            }

            rptrUsers.DataSource = manager.Users.ToList();
            rptrUsers.DataBind();
        }

        public string getUserRole(string user)
        {
            return manager.GetRoles(user)[0];
        }


        protected void lockOutUser_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (manager.GetRoles(btn.CommandArgument)[0] == "Admin")
            {
                Msg.Text = "Cannot lockout admin.";
                return;
            }
            manager.SetLockoutEnabled(btn.CommandArgument, true);
            manager.SetLockoutEndDate(btn.CommandArgument, DateTime.UtcNow.AddMinutes(10));
            manager.Update(manager.FindById(btn.CommandArgument));
            Response.Redirect("~/AdminPage/Admin");
        }

        protected void lockInUser_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (manager.GetRoles(btn.CommandArgument)[0] == "Admin")
            {
                Msg.Text = "Cannot lockin admin.";
                return;
            }
            manager.SetLockoutEnabledAsync(btn.CommandArgument, false);
            Response.Redirect("~/AdminPage/Admin");
        }

        protected void deleteUser_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (manager.GetRoles(btn.CommandArgument)[0] == "Admin")
            {
                Msg.Text = "Cannot delete admin.";
                return;
            }
            var user = manager.FindById(btn.CommandArgument);
            manager.Delete(user);
            Response.Redirect("~/AdminPage/Admin");
        }
    }
}
