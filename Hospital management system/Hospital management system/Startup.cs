using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Hospital_management_system.Startup))]
namespace Hospital_management_system
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
