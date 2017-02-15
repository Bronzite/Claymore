using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Claymore.Startup))]
namespace Claymore
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
