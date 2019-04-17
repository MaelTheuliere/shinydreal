$(document).on("click", ".select-items > div", function(evt) {
  var el = $(evt.target);
  console.log("plop");
  el.trigger("go");
});


var selectBinding = new Shiny.InputBinding();

$.extend(selectBinding, {
  find: function(scope) {
    return $(scope).find(".select-items > div");
  },
  getValue: function(el) {  
    return $(el).html();
  },
  setValue: function(el, value) {
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.selectBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".selectBinding");
  }
});

Shiny.inputBindings.register(selectBinding);