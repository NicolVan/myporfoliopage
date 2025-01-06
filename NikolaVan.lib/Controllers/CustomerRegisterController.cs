using dufeksoft.lib.Mail;
using NikolaVan.lib.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using Umbraco.Web.Mvc;
using Mailer = NikolaVan.lib.Util.MyWebNikolaMailer;

namespace NikolaVan.lib.Controllers
{
    [PluginController("MyWebNikola")]
    public class CustomerRegisterController : _BaseController
    {
        public ActionResult LostPassword()
        {
            return View(new LostPasswordModel());
        }
        [HttpPost]
        public ActionResult SubmitLostPassword(LostPasswordModel model)
        {
            TempData["success"] = null;

            if (ModelState.IsValid)
            {
                var memberService = Services.MemberService;
                var member = memberService.GetByEmail(model.Email);

                if (member == null)
                {
                    ModelState.AddModelError("", "Užívateľ pre zadanú e-mailovú adresu neexistuje.");
                }
                else
                {
                    string temporaryPassword = GenerateTemporaryPassword();

                    try
                    {
                        memberService.SavePassword(member, temporaryPassword); // Automaticky hashuje heslo
                        List<TextTemplateParam> paramList = new List<TextTemplateParam>
                {
                    new TextTemplateParam("LOGIN", member.Email),
                    new TextTemplateParam("PASSWORD", temporaryPassword)
                };

                      Mailer.SendMailTemplateWithoutBcc(
                            "Obnovenie prístupu na nikolvaniscak.sk",
                            TextTemplate.GetTemplateText("LostPassword_Sk", paramList),
                            member.Email
                        );

                        TempData["success"] = true;
                    }
                    catch (Exception exc)
                    {
                        ModelState.AddModelError("", $"Chyba pri odosielaní e-mailu: {exc.Message}");
                    }
                }
            }

            return CurrentUmbracoPage();
        }
        private string GenerateTemporaryPassword()
        {
            return Guid.NewGuid().ToString("N").Substring(0, 8);
        }
    }
}
