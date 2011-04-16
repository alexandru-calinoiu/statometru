// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
    $('#location').keyup(function(){
        $.get('/locations/autocomplete', {value: $(this).val()}, function(data){

        });
    });

    $('#institution').keyup(function(){
        $.get('/institutions/find', {search_term: $(this).val(), search_location: $('#location').val()}, function(data){
            $('#content').html(data);
        })
    });
});