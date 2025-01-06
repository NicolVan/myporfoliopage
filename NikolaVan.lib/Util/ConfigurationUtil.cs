using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NikolaVan.lib.Util
{
    public class ConfigurationUtil
    {
        public const string LoginFormId = "nikolvan.LoginFormId";
        public const string AfterLoginFormId = "nikolvan.AfterLoginFormId";
        public const string AfterPasswordResetFormId = "nikolvan.AfterPasswordResetFormId";
        public const string MembersFormId = "nikolvan.MembersFormId";
        public const string CustomersFormId = "nikolvan.CustomersFormId";

        public static int GetPageId(string pageKey)
        {
            return int.Parse(ConfigurationManager.AppSettings[pageKey]);
        }

        public static string GetCfgValue(string cfgKey)
        {
            return ConfigurationManager.AppSettings[cfgKey];
        }
    }
}
