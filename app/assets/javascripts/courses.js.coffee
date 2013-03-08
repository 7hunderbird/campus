# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("div.outline-content").mouseover ->
  $(this).children("[class*='icon']").show()

$("div.outline-content").mouseout ->
  $(this).children("[class*='icon']").hide()

$('#outline').sortable
  axis: 'y'
  update: ->
    $.post($(this).data('update-outline'), $(this).sortable('serialize'))
    
$("#course-search").keyup ->
  $(this).submit()
