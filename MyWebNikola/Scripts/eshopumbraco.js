$(document).ready(function () {
    // Contact
    eshopumbracoContactFormApi();
});

/* contact */
function eshopumbracoContactFormApi() {
    if ($('.api-password-group').length > 0) {
        $.ajax('/Umbraco/EshopUmbraco/EshopUmbracoApi/ContactFormApiKey',
            {
                type: 'POST',
                success: function (data) {
                    $('.api-password-group #Password').val(data.MainKey);
                    $('.api-password-group #ConfirmPassword').val(data.SubKey);
                }
            });
    }
}