$(document).ready(function () {
    // Hide mobile menu
    $('.navbar-collapse a').click(function (e) {
        if ($('.navbar-toggle').is(':visible')) {
            $('.navbar-collapse').collapse('toggle');
        }
    });
});

