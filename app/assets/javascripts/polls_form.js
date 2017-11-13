$(document).on('turbolinks:load', function(){
  if ($(".polls.new").length < 1 && $(".polls.edit").length < 1) {
    return;
  }

  if ($('div.answer-field').length < 2) {
    $('a.remove_fields').addClass('disabled');
    $('a.remove_fields').bind('click', false);
  }

  $( 'body' ).on('click', 'a.remove_fields', function() {
    if ($('div.answer-field').length <= 2) {
      $('a.remove_fields').addClass('disabled');
      $('a.remove_fields').bind('click', false);
    }
  });

  $( "a.add_fields" ).click(function() {
    if ($('div.answer-field').length >= 1) {
      $('a.remove_fields').removeClass('disabled');
      $('a.remove_fields').unbind('click', false);
    }
  });
});
