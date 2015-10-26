
$ ->
  $(".alert").delay(1000).slideUp(2000)

$ ->
  $(".dropdown-toggle").click (e) ->
    $(".dropdown-menu").slideToggle("fast")

$ ->
  $('#oERP-modal').on 'show.bs.modal', (e) ->
    $(this).find('.modal-body').text 'Are you sure to delete ' + $(e.relatedTarget).data('name') + ' ?'
    $(this).find('.btn-ok').attr 'href', $(e.relatedTarget).data('path') + '/' + $(e.relatedTarget).data('id')