todo ?= {}

todo.start = ->
  todo.controller
    views:
      todoForm: calatrava.bridge.pages.pageNamed "todoForm"
    changePage: calatrava.bridge.changePage
    ajax: calatrava.bridge.request

  calatrava.bridge.changePage "todoForm"

