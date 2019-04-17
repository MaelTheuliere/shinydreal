$(document).on("click", ".custom-control-input", function(evt) {
  var el = $(evt.target);
  console.log("click");
  el.trigger("go");
});


var radioButtonBinding = new Shiny.InputBinding();

$.extend(radioButtonBinding, {
  find: function(scope) {
    return $(scope).find(".custom-control-input");
  },
  getValue: function(el) {  
    return $(el).find(":nth-child(2)").html()
  },
  setValue: function(el, value) {
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("go.radioButtonBinding", function(e) {
      console.log("radioButtonBinding");
      debugger;
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".radioButtonBinding");
  }
});

Shiny.inputBindings.register(radioButtonBinding);