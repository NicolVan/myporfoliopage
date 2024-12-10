using NikolaVan.lib.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NikolaVan.lib
{
    public class NikolaVaniscakUmbracoApp : Umbraco.Web.UmbracoApplication
    {
        public override void Init()
        {
            base.Init();
            TranslateUtil.RegisterTranslations();
        }
    }
}
