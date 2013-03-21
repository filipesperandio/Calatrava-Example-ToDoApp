todo ?= {}
todo.controller = ({views, changePage, ajax}) ->
  tasks = []
  addTask = ->
    views.todoForm.get "taskInput", (input) ->
      task =
        label : input
        done : false
        id : "task" + tasks.length
      tasks.push task
      views.todoForm.render tasks

  taskDone = (id) ->
    _.each tasks, (t) ->
      if(id == t.id)
        t.done = !t.done
    views.todoForm.render tasks

  views.todoForm.bind 'submit', addTask
  views.todoForm.bind 'taskDone', taskDone


