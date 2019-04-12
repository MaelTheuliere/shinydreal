$( document ).ready(function() {
  Shiny.addCustomMessageHandler('updateProgressBar', function(message) {
    $("#" + message.id).attr("style", "width: " + message.width + "%");
  })
});
