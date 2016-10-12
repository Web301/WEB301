using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Web301.Startup))]
namespace Web301
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
