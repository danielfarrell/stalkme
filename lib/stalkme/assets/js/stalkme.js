var $statuses = jQuery('#statuses');
var addStatus = function (event) {
  var s = $(event.data);
  s.find("abbr.timeago").timeago();
  $statuses.prepend(s);
};

var socket = new Phoenix.Socket("ws://" + location.host + "/ws");
socket.join("live", "updates", {}, function(chan){
  chan.on("update", function(msg){
    var $msg = $(msg);
    $msg.find("abbr.timeago").timeago();
    $statuses.prepend($msg);
  });
});

$(document).ready(function() {
  $("abbr.timeago").timeago();
  $('form').ajaxForm(function(r, status, xhr, form){
    form[0].reset();
  });
});
