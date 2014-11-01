// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require bootstrap/tooltip

var vote = function(up, success, error) {
  $.ajax('/towns/' + ISSUE.town_id + '/issues/' + ISSUE.id + '/votes', {
    data: {
      up: !!up
    },
    type: 'POST',
    dataType: 'json',
    success: success,
    error: error
  }
  );
};

var _handleVoteButtonFn = function(up) {
  return function() {
    var button = $(this);
    vote(up, function() {
      $('.vote-controls > .active').toggleClass('active', false);
      button.toggleClass('active', true);
    });
  };
};

$().ready(function() {
  $('.vote-controls .up').click(_handleVoteButtonFn(true));
  $('.vote-controls .down').click(_handleVoteButtonFn(false));

});