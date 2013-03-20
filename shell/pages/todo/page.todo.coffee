calatrava.pageView ?= {}

calatrava.pageView.todo = ->
  container = []
  $page = $('#todo')
  el = (sel)-> $("#"+sel, $page)

  draw = (task) ->
    li = $('<li>')
    label = $('<span>')
    checkbox = $("<input class='taskDone' type='checkbox' id='#{task.id}'>")
    checkbox.attr('checked', 'checked') unless !task.done
    label.text task.label
    checkbox.appendTo li
    label.appendTo li
    li.appendTo $('ul', $page)

  bind: (event, handler) ->
    container[event] = handler
    el(event).off('click').on 'click', handler

  render: (tasks) ->
    $('#taskList li').remove()
    draw task for task in tasks
    $('.taskDone').click ->
      container['taskDone'] this.id

  get: (field) ->
    $page.find("#" + field).val()

  show: ->
    $page.show()

  hide: ->
    $page.hide()

