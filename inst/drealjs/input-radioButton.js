$(document).on("click", ".custom-control-parent-radio", function(evt) {
  var el = $(evt.target);
  console.log($(el));
  el.children().on("click", function(e) {
    e.stopPropagation();
  });
  var big_nodes = $(el).parent().parent();
  $(big_nodes).find("label").removeClass("checked");
  el.toggleClass("checked");
  el.trigger("change");
});


var checkboxBinding = new Shiny.InputBinding();

$.extend(checkboxBinding, {
  find: function(scope) {
    return $(scope).find(".custom-control-parent-radio");
  },
  getValue: function(el) {  
    var plop = [];
    var inputses = $(el).children();
    for (i = 0; i < inputses.length; i++) { 
      if ($(inputses[i]).find("label").hasClass("checked")) {
        plop.push(
          $(inputses[i]).find("label").data("name")
        );
      }
    }
    console.log(plop)
    return plop;
  },
  setValue: function(el, value) {
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.checkboxBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".checkboxBinding");
  }
});

Shiny.inputBindings.register(checkboxBinding);