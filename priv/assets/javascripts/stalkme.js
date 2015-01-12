var $statuses = jQuery('#statuses');
var addStatus = function (event) {
  var s = $(event.data);
  s.find("abbr.timeago").timeago();
  $statuses.prepend(s);
};

var socket = new Phoenix.Socket("ws://" + location.host + "/ws");
socket.join("live", {}, function(chan){
  chan.on("updates:update", function(msg){
    var $msg = $(msg.body);
    $msg.find("abbr.timeago").timeago();
    $statuses.prepend($msg);
  });
});

$(document).ready(function() {
  $("abbr.timeago").timeago();
  $("form#new_status").ajaxForm(function(r, status, xhr, form){
    form[0].reset();
  });
});
