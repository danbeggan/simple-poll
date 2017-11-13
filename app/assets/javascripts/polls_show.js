$(document).on('turbolinks:load', function(){
  if ($(".polls.show").length < 1) {
    return;
  }

  $( 'a.vote' ).click(function() {
    event.preventDefault();
    var poll_id = $(this).data('poll-id');
    var answer_id = $(this).data('answer-id');
    $.ajax({
      url:'/polls/'+poll_id+'/answers/'+answer_id,
      dataType: 'json',
      type:'PATCH',
      success:function(data){
        updateResults(data);
        $('.answers').hide();
        $('.results').show();
      },
      error:function(data){
        alert('Sorry your vote was not cast, please try again');
      }
    });
  });

  (function worker() {
    var poll_id = $('.poll_name').data('poll-id');

    $.ajax({
      url: '/polls/'+poll_id,
      dataType: 'json',
      success: function(data) {
        updateResults(data);
      },
      complete: function() {
        // Schedule the next request when the current one's complete
        setTimeout(worker, 5000);
      }
    });
  })();

});

// Takes json returned from controller and updates results to show new values
function updateResults(data) {
  for (var i in data.answers) {
    var result = $('.result[data-answer-id='+data.answers[i].id+']');

    if(result.text().match(/\d+/)[0] != data.answers[i].votes){
      result.text(data.answers[i].votes + ' Votes');
    }
  }
}

// // Builder for creating a results div
//
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
