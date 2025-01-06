using dufeksoft.lib.Mail;
using NikolaVan.lib.Controllers;
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
using Umbraco.Web.Mvc;

namespace NikolaVan.lib.Controllers
{
    [PluginController("MyWebNikola")]
    public class MemberController : _BaseController
    {
        public ActionResult Login()
        {
            return View(new LoginModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SubmitLogin(LoginModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (Members.Login(model.Username, model.Password))
                {
                    //FormsAuthentication.SetAuthCookie(model.Username, false);
                    UrlHelper myHelper = new UrlHelper(HttpContext.Request.RequestContext);
                    if (myHelper.IsLocalUrl(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return this.RedirectToUmbracoPage(ConfigurationUtil.AfterLoginFormId);
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Neplatné meno alebo heslo.");
                }
            }
            return CurrentUmbracoPage();
        }

        public ActionResult Logout()
        {
            TempData.Clear();
            Session.Clear();
            Members.Logout();
            return this.RedirectToUmbracoPage(ConfigurationUtil.LoginFormId);
        }

        public ActionResult MemberInfo()
        {
            return View();
        }

        [Authorize(Roles = MemberRepository.NikolaVanMemberAdminRole)]
        public ActionResult GetRecords(int page = 1, string sort = "Name", string sortDir = "ASC")
        {
            MemberRepository repository = new MemberRepository();

            return View(MemberListModel.CreateCopyFrom(repository.GetAll(sort, sortDir)));
        }


        [Authorize(Roles = MemberRepository.NikolaVanMemberAdminRole)]
        public ActionResult InsertRecord()
        {
            return View(new MemberModel());
        }

        [Authorize(Roles = MemberRepository.NikolaVanMemberAdminRole)]
        public ActionResult EditRecord(string id)
        {
            string isCustomerEdit = null;
            if (!string.IsNullOrEmpty(id))
            {
                string[] par = id.Split('|');
                id = par[0];
                if (par.Length > 1 && par[1] == ParamUtil.IsCustomerEdit)
                {
                    isCustomerEdit = ParamUtil.IsCustomerEdit;
                }
            }

            MemberRepository repository = new MemberRepository();
            MemberModel model = MemberModel.CreateCopyFrom(repository.Get(id));
            model.IsCustomerEdit = isCustomerEdit;

            return View(model);
        }
        [HttpPost]
        [Authorize(Roles = MemberRepository.NikolaVanMemberAdminRole)]
        [ValidateAntiForgeryToken]
        public ActionResult SaveRecord(MemberModel model)
        {
            if (!ModelState.IsValid)
            {
                return CurrentUmbracoPage();
            }

            if (model.IsNew)
            {
                if (string.IsNullOrEmpty(model.Password))
                {
                    ModelState.AddModelError("Password", "Heslo musí byť zadané.");
                }
                if (string.IsNullOrEmpty(model.PasswordRepeat))
                {
                    ModelState.AddModelError("PasswordRepeat", "Zopakované heslo musí byť zadané.");
                }
                if (model.Password != model.PasswordRepeat)
                {
                    ModelState.AddModelError("PasswordRepeat", "Heslo a zopakované heslo musia byť rovnaké.");
                }
            }

            if (ModelState.IsValid)
            {
                MemberRepository repository = new MemberRepository();
                MembershipCreateStatus status = repository.Save(this, MemberModel.CreateCopyFrom(model));
                if (status != MembershipCreateStatus.Success)
                {
                    ModelState.AddModelError("", string.Format("Nastala chyba pri zápise záznamu do systému. {0}. Opravte chyby a skúste akciu zopakovať. Ak sa chyba vyskytne znovu, kontaktujte nás prosím.", repository.GetErrorMessage(status)));
                }
            }
            if (!ModelState.IsValid)
            {
                return CurrentUmbracoPage();
            }

            return string.IsNullOrEmpty(model.IsCustomerEdit) ? this.RedirectToUmbracoPage(ConfigurationUtil.MembersFormId) : this.RedirectToUmbracoPage(ConfigurationUtil.CustomersFormId);
        }


        [Authorize(Roles = MemberRepository.NikolaVanMemberAdminRole)]
        public ActionResult ConfirmDeleteRecord(string id)
        {
            MemberRepository repository = new MemberRepository();
            MemberModel model = MemberModel.CreateCopyFrom(repository.Get(id));

            return View(model);
        }
        [HttpPost]
        [Authorize(Roles = MemberRepository.NikolaVanMemberAdminRole)]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteRecord(MemberModel model)
        {
            if (!ModelState.IsValid)
            {
                return CurrentUmbracoPage();
            }

            MemberRepository repository = new MemberRepository();
            MembershipCreateStatus status = repository.Delete(MemberModel.CreateCopyFrom(model));
            if (status != MembershipCreateStatus.Success)
            {
                ModelState.AddModelError("", string.Format("Nastala chyba pri zápise záznamu do systému. {0}. Opravte chyby a skúste akciu zopakovať. Ak sa chyba vyskytne znovu, kontaktujte nás prosím.", repository.GetErrorMessage(status)));
            }
            if (!ModelState.IsValid)
            {
                return CurrentUmbracoPage();
            }

            return this.RedirectToUmbracoPage(ConfigurationUtil.MembersFormId);
        }
        [Authorize(Roles = MemberRepository.NikolaVanMemberAdminRole)]
        public ActionResult EditPassword(string id)
        {
            string isCustomerEdit = null;
            if (!string.IsNullOrEmpty(id))
            {
                string[] par = id.Split('|');
                id = par[0];
                if (par.Length > 1 && par[1] == ParamUtil.IsCustomerEdit)
                {
                    isCustomerEdit = ParamUtil.IsCustomerEdit;
                }
            }

            MemberRepository repository = new MemberRepository();
            MemberModel model = MemberModel.CreateCopyFrom(repository.Get(id));
            model.IsCustomerEdit = isCustomerEdit;

            return View(model);
        }
        [HttpPost]
        [Authorize(Roles = MemberRepository.NikolaVanMemberAdminRole)]
        [ValidateAntiForgeryToken]
        public ActionResult SavePassword(MemberModel model)
        {
            if (!ModelState.IsValid)
            {
                return CurrentUmbracoPage();
            }

            if (string.IsNullOrEmpty(model.Password))
            {
                ModelState.AddModelError("Password", "Heslo musí byť zadané.");
            }
            if (string.IsNullOrEmpty(model.PasswordRepeat))
            {
                ModelState.AddModelError("PasswordRepeat", "Zopakované heslo musí byť zadané.");
            }
            if (model.Password != model.PasswordRepeat)
            {
                ModelState.AddModelError("", "Heslo a zopakované heslo musia byť rovnaké.");
            }

            if (ModelState.IsValid)
            {
                MemberRepository repository = new MemberRepository();
                MembershipCreateStatus status = repository.SavePassword(MemberModel.CreateCopyFrom(model));
                if (status != MembershipCreateStatus.Success)
                {
                    ModelState.AddModelError("", string.Format("Nastala chyba pri zápise záznamu do systému. {0}. Opravte chyby a skúste akciu zopakovať. Ak sa chyba vyskytne znovu, kontaktujte nás prosím.", repository.GetErrorMessage(status)));
                }
            }
            if (!ModelState.IsValid)
            {
                return CurrentUmbracoPage();
            }

            return string.IsNullOrEmpty(model.IsCustomerEdit) ? this.RedirectToUmbracoPage(ConfigurationUtil.MembersFormId) : this.RedirectToUmbracoPage(ConfigurationUtil.CustomersFormId);
        }
    }
}