calatrava.pageView ?= {}

calatrava.pageView.todoForm = ->
  controllerCallback = []
  $page = $('#todoForm')
  el = (sel)-> $("#"+sel, $page)
  tasks = []

  draw = (task) ->
    li = $('<li>')
    label = $('<span>')
    checkbox = $("<input class='taskDone' type='checkbox' id='#{task.id}'>")
    checkbox.attr('checked', 'checked') unless !task.done
    label.text task.label
    checkbox.appendTo li
    label.appendTo li
    li.appendTo $('ul', $page)

  renderTasks = ->
    $('#taskList li').remove()
    draw task for task in tasks
    $('.taskDone').click ->
      controllerCallback['taskDone'] this.id

  bind: (event, handler) ->
    controllerCallback[event] = handler
    if event == 'submit'
      el('submit').off('click').on('click', controllerCallback['submit'])
    renderTasks()

  render: (_tasks) ->
    tasks = _tasks if _tasks
    renderTasks()

  get: (field) ->
    $page.find("#" + field).val()

  show: ->
    $page.show()

  hide: ->
    $page.hide()

