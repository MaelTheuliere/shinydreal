$( document ).ready(function() {
  $( ".panel" ).hide().trigger('hidden'); 
  $( ".panel" ).first().show().trigger('shown'); 
  $( ".nav-item" ).first().addClass("active"); 
});