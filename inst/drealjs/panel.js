$( document ).ready(function() {
  $( ".panel" ).hide().trigger('hidden'); 
  $( ".panel" ).first().show().trigger('shown'); 
  $( ".nav-item" ).first().addClass("active"); 
});

$( document ).ready(function() {
  $(".custom-radio").on("click", function(){
    $(".custom-control-indicator").removeClass("custom-control-indicator-before");
    $(this).find(":nth-child(2)").addClass("custom-control-indicator-before");
  });
})
