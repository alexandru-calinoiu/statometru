// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var institution_value, institution_default_value, location_default_value;
$(function() {
    institution_value = $('#institution').val();
    location_default_value = $('#location').val();
    setInterval(instantSearch, 1000);
    $('#location').change(function() {
        $.get('/locations/autocomplete', {value: $(this).val()}, function(data) {

        });
    });
});

function instantSearch()
{
    var current_value = $('#institution').val();
    var location_value = $('#location').val();
    if(institution_value != current_value)
    {
        if(current_value.length > 1)
        {
            $.get('/find', {
                    institution: (current_value == institution_default_value ? '' : current_value),
                    location: (location_value == location_default_value ? '' : location_value)},
                function(data) {
                    $('#content').html(data);
            });
        }
    }
    institution_value = current_value;
}