$( document ).ready(function() {
  $( ".panel" ).hide().trigger('hidden'); 
  $( ".panel" ).first().show().trigger('shown'); 
  $( ".nav-side" ).first().addClass("active"); 
});