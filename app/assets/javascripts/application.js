// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require cocoon
// = require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function(){

  $( 'body' ).on('click', 'a.remove_fields', function() {
    if ($('div.answer-field').length <= 2) {
      $('a.remove_fields').addClass('disabled');
      $('a.remove_fields').bind('click', false);
    }
  });

  $( "a.add_fields" ).click(function() {
    if ($('div.answer-field').length < 2) {
      $('a.remove_fields').removeClass('disabled');
      $('a.remove_fields').unbind('click', false);
    }
  });

  // TODO: Move to polls.js
  $( 'a.vote' ).click(function() {
    event.preventDefault();
    var poll_id = $(this).data('poll-id');
    var answer_id = $(this).data('answer-id');
    console.log('poop');
    $.ajax({
      url:'/polls/'+poll_id+'/answers/'+answer_id,
      dataType: 'json',
      type:'PATCH',
      success:function(data){
        // for (var i in data.answers) {
        //   $('.results').append(
        //     $('<div/>', {'class': 'vote-container'}).append(
        //       $('<h4/>').append(
        //         data.answers[i].name
        //       ).append(
        //         $('<div/>', {'class': 'right'}).append(
        //           data.answers[i].votes
        //         )
        //       )
        //     ).append(
        //       $('<hr/>')
        //     )
        //   );
        // }
        console.log(data);
        updateResults(data);
        $('.answers').hide();
        $('.results').show();
      },
      error:function(data){
        // TODO: show results anyways and alert
        alert('Sorry could not register vote');
      }
    });
  });

  // TODO: call function every couple of seconds
  function updateResults(data) {
    for (var i in data.answers) {
      var result = $('.result[data-answer-id='+data.answers[i].id+']');

      if(result.text().match(/\d+/)[0] != data.answers[i].votes){
        result.text(data.answers[i].votes + ' Votes');
      }
    }
  }

  $(document).foundation();

});
