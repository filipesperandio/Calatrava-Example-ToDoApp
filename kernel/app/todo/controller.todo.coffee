todo ?= {}
todo.controller = ({views, changePage, ajax}) ->
  tasks = []
  addTask = ->
    views.todo.get "taskInput", (input) ->
      task =
        label : input
        done : false
        id : "task" + tasks.length
      tasks.push task
      views.todo.render tasks

  taskDone = (id) ->
    _.each tasks, (t) ->
      if(id == t.id)
        t.done = !t.done
    views.todo.render tasks

  views.todo.bind 'submit', addTask
  views.todo.bind 'taskDone', taskDone


