$(document).on("click", ".fleche", function(evt) {
  
  // evt.target is the button that was clicked
  var el = $(evt.target);

  // Set the button's text to its current value plus 1
  el.data("value", parseInt(el.data("value")) + 1)  
  // Raise an event to signal that the value changed
  el.trigger("change");
  
});

var flecheBinding = new Shiny.InputBinding();

$.extend(flecheBinding, {
  find: function(scope) {
    return $(scope).find(".fleche");
  },
  getValue: function(el) {  
    return parseInt($(el).data("value"));
  },
  setValue: function(el, value) {
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.flecheBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".flecheBinding");
  }
});

Shiny.inputBindings.register(flecheBinding);