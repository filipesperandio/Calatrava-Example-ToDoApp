(function() {

  if (typeof todo === "undefined" || todo === null) todo = {};

  todo.controller = function(_arg) {
    var addTask, ajax, changePage, taskDone, tasks, views;
    views = _arg.views, changePage = _arg.changePage, ajax = _arg.ajax;
    tasks = [];
    addTask = function() {
      return views.todoForm.get("taskInput", function(input) {
        var task;
        task = {
          label: input,
          done: false,
          id: "task" + tasks.length
        };
        tasks.push(task);
        return views.todoForm.render(tasks);
      });
    };
    taskDone = function(id) {
      _.each(tasks, function(t) {
        if (id === t.id) return t.done = !t.done;
      });
      return views.todoForm.render(tasks);
    };
    views.todoForm.bind('submit', addTask);
    views.todoForm.bind('taskDone', taskDone);
    return views.todoForm.bind('pageOpened', function() {
      return views.todoForm.render(tasks);
    });
  };

}).call(this);
