using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(COMP4952Medium.Startup))]
namespace COMP4952Medium
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
