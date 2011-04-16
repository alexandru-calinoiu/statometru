// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
    $('#location').change(function() {
        $.get('/locations/autocomplete', {value: $(this).val()}, function(data) {

        });
    });

    $('#institution').keyup(function() {
        $.get('/find', {
            institution: ($(this).val() == 'valueInstitutia (ex. Spitalul Municipal)' ? '' : $(this).val()),
            location: ($('#location').val() == 'valueLocatie (ex. Sibiu)' ? '' : $('#location').val())}, function(data) {
            $('#content').html(data);
        });
    });
});