$(document).on("click", ".switch-toggle-switch", function(evt) {
  var el = $(evt.target);
  
  var val = parseInt(el.data("value"))
  
  if (val == 1){
    el.data("value", 0);
  } 
  if (val === 0){
    el.data("value", 1);
  } 

  el.trigger("change");
  
});

var onoffBinding = new Shiny.InputBinding();

$.extend(onoffBinding, {
  find: function(scope) {
    return $(scope).find(".switch-toggle-switch");
  },
  getValue: function(el) {  
    return parseInt($(el).data("value"));
  },
  setValue: function(el, value) {
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.onoffBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".onoffBinding");
  }
});

Shiny.inputBindings.register(onoffBinding);