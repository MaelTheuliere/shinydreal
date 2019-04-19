$(document).on("click", ".control-select", function(evt) {
  var el = $(evt.target);
  el.trigger("go");
});


var selectBinding = new Shiny.InputBinding();

$.extend(selectBinding, {
  find: function(scope) {
    return $(scope).find(".control-select");
  },
  getValue: function(el) {  
    var plop = $(el).find(".select-items").find(".same-as-selected").html();
    if (plop === undefined){
       var plop = $(el).find(".same-as-selected").html()
    };
    return plop;
  },
  setValue: function(el, value) {
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("go.selectBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".selectBinding");
  }
});

Shiny.inputBindings.register(selectBinding);