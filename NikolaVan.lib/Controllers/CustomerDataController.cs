using NikolaVan.lib.Models;
using NikolaVan.lib.Repositories;
using NikolaVan.lib.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.Security;
using System.Web;
using Umbraco.Web.Mvc;

namespace NikolaVan.lib.Controllers
{
    [PluginController("MyWebNikola")]
    [Authorize(Roles = MemberRepository.NikolaVanMemberCustomerRole)]
    public class CustomerDataController : _BaseController
    {
    
        public ActionResult EditMyPassword()
        {
            return View(new ChangePasswordModel());
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SaveMyPassword(ChangePasswordModel model)
        {
            if (!ModelState.IsValid)
            {
                return CurrentUmbracoPage();
            }

            if (model.NewPassword != model.NewPasswordRepeat)
            {
                ModelState.AddModelError("", "Heslo a zopakované heslo musia byť rovnaké.");
            }
            else
            {
                if (!CustomerModel.VerifyUserPassword(CustomerModel.GetCurrentMemberName(), model.OldPassword))
                {
                    ModelState.AddModelError("", "Staré heslo je nesprávne.");
                }
            }

            if (ModelState.IsValid)
            {
                MemberRepository repository = new MemberRepository();
                MemberModel memberModel = MemberModel.CreateCopyFrom(repository.Get(CustomerModel.GetCurrentMemberId()));
                memberModel.Password = model.NewPassword;
                memberModel.PasswordRepeat = model.NewPasswordRepeat;
                MembershipCreateStatus status = repository.SavePassword(MemberModel.CreateCopyFrom(memberModel));
                if (status != MembershipCreateStatus.Success)
                {
                    ModelState.AddModelError("", string.Format("Nastala chyba pri zápise záznamu do systému. {0}. Opravte chyby a skúste akciu zopakovať. Ak sa chyba vyskytne znovu, kontaktujte nás prosím.", repository.GetErrorMessage(status)));
                }
            }
            if (!ModelState.IsValid)
            {
                return CurrentUmbracoPage();
            }

            return this.RedirectToUmbracoPage(ConfigurationUtil.AfterLoginFormId);
        }
    }
}
