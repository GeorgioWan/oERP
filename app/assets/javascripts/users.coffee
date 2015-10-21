# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#oERP-modal').on 'show.bs.modal', (e) ->
    $(this).find('.modal-body').text 'Are you sure to delete ' + $(e.relatedTarget).data('username') + ' ?'
    $(this).find('.btn-ok').attr 'href', '/users/' + $(e.relatedTarget).data('userid')


