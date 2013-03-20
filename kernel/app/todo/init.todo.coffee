todo ?= {}

todo.start = ->
  todo.controller
    views:
      todo: calatrava.bridge.pages.pageNamed "todo"
    changePage: calatrava.bridge.changePage
    ajax: calatrava.bridge.request

  calatrava.bridge.changePage "todo"

