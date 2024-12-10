$(document).ready(function () {
    // Contact
    NikolavaniscakovaContactFormApi();
}); function NikolavaniscakovaContactFormApi() {
    if ($('.api-password-group').length > 0) {
        $.ajax('/Umbraco/MyWebNikola/MyWebNikolaApi/ContactFormApiKey',
            {
                type: 'POST',
                success: function (data) {
                    console.log("API keys received:", data);
                    $('.api-password-group #Password').val(data.MainKey);
                    $('.api-password-group #ConfirmPassword').val(data.SubKey);
                }
            });
    }
}