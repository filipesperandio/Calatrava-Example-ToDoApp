(function() {

  if (typeof todo === "undefined" || todo === null) todo = {};

  todo.start = function() {
    todo.controller({
      views: {
        todoForm: calatrava.bridge.pages.pageNamed("todoForm")
      },
      changePage: calatrava.bridge.changePage,
      ajax: calatrava.bridge.request
    });
    return calatrava.bridge.changePage("todoForm");
  };

}).call(this);
