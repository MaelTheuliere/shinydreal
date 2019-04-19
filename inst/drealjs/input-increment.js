$(document).on("click", ".dropdown-item", function(evt) {
  // evt.target is the button that was clicked
  var el = $(evt.target);

  // Set the button's text to its current value plus 1
  $(el).data("value", $(el).data("value") + 1)

  // Raise an event to signal that the value changed
  el.trigger("change");
});

var incrementBinding = new Shiny.InputBinding();
$.extend(incrementBinding, {
  find: function(scope) {
    return $(scope).find(".dropdown-item");
  },
  getValue: function(el) {
    return $(el).data("value");
  },
  setValue: function(el, value) {
    $(el).text(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.incrementBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".incrementBinding");
  }
});

Shiny.inputBindings.register(incrementBinding);