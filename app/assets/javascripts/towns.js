// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function makeThisMyTown(success, error) {
  $.ajax('/users/' + AUTHENTICATED_USER.id, {
    data: {user: {
      my_town_id: TOWN.id
    }},
    type: 'PATCH',
    dataType: 'json',
    success: success,
    error: error
  }
  );
}

$().ready(function() {
  $('.make-my-town.add').click(function() {
    var button = $(this);
    var myTownHtml = '<span class="glyphicon glyphicon-star"></span>&nbsp;My Town';
    var notMyTownHtml = '<span class="glyphicon glyphicon-star-empty"></span>&nbsp;Make this My Town';
    makeThisMyTown(function() {
      button.html(myTownHtml);
      button.toggleClass('remove', true);
    });
  });
  
});