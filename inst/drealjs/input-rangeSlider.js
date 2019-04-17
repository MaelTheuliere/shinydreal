$(document).on("change", ".slideranger", function(evt) {
  
  // evt.target is the button that was clicked
  var el = $(evt.target);

  // Set the button's text to its current value plus 1
  // el.data("value", parseInt(el.data("value")) + 1)  
  // Raise an event to signal that the value changed
  el.trigger("go");
  
});

var sliderangerBinding = new Shiny.InputBinding();

$.extend(sliderangerBinding, {
  find: function(scope) {
    return $(scope).find(".slideranger");
  },
  getValue: function(el) {  
    return $(el).val();
  },
  setValue: function(el, value) {
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("go.sliderangerBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".sliderangerBinding");
  }
});

Shiny.inputBindings.register(sliderangerBinding);