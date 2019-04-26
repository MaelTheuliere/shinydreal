$(document).on("click", ".navigationbutton", function(evt) {
  //debugger;
  // evt.target is the button that was clicked
  var el = $(evt.target);

  // Set the button's text to its current value plus 1
  el.data("value", parseInt(el.data("value")) + 1)  
  // Raise an event to signal that the value changed
  el.trigger("change");
  
});

var navigationBinding = new Shiny.InputBinding();

$.extend(navigationBinding, {
  find: function(scope) {
    return $(scope).find(".navigationbutton");
  },
  getValue: function(el) {  
    return parseInt($(el).data("value"));
  },
  
  setValue: function(el, value) {
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.navigationBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".navigationBinding");
  }
});

Shiny.inputBindings.register(navigationBinding);