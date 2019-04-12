$(document).on("click", ".progressBar", function(evt) {
  
  // evt.target is the button that was clicked
  var el = $(evt.target);

  // Set the button's text to its current value plus 1
  el.data("value", parseInt(el.data("value")) + 1)  
  // Raise an event to signal that the value changed
  el.trigger("change");
  
});

var progressBarBinding = new Shiny.InputBinding();

$.extend(progressBarBinding, {
  find: function(scope) {
    return $(scope).find(".progressBar");
  },
  getValue: function(el) {  
    return parseInt($(el).data("value"));
  },
  setValue: function(el, value) {
    
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.progressBarBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".progressBarBinding");
  },
  receiveMessage: function(el, data) {
    $(el).attr("style", "width: " + data.value + "%") 
    $(el).trigger('change');
  }
  
});

Shiny.inputBindings.register(progressBarBinding);