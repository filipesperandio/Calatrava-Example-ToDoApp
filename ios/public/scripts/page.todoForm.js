(function() {

  if (calatrava.pageView == null) calatrava.pageView = {};

  calatrava.pageView.todoForm = function() {
    var $page, controllerCallback, draw, el, renderTasks, tasks;
    controllerCallback = [];
    $page = $('#todoForm');
    el = function(sel) {
      return $("#" + sel, $page);
    };
    tasks = [];
    draw = function(task) {
      var checkbox, label, li;
      li = $('<li>');
      label = $('<span>');
      checkbox = $("<input class='taskDone' type='checkbox' id='" + task.id + "'>");
      if (!!task.done) checkbox.attr('checked', 'checked');
      label.text(task.label);
      checkbox.appendTo(li);
      label.appendTo(li);
      return li.appendTo($('ul', $page));
    };
    renderTasks = function() {
      var task, _i, _len;
      $('#taskList li').remove();
      for (_i = 0, _len = tasks.length; _i < _len; _i++) {
        task = tasks[_i];
        draw(task);
      }
      return $('.taskDone').click(function() {
        return controllerCallback['taskDone'](this.id);
      });
    };
    return {
      bind: function(event, handler) {
        controllerCallback[event] = handler;
        if (event === 'submit') {
          el('submit').off('click').on('click', controllerCallback['submit']);
        }
        return renderTasks();
      },
      render: function(_tasks) {
        if (_tasks) tasks = _tasks;
        return renderTasks();
      },
      get: function(field) {
        return $page.find("#" + field).val();
      },
      show: function() {
        return $page.show();
      },
      hide: function() {
        return $page.hide();
      }
    };
  };

}).call(this);
