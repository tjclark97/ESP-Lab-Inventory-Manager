$(document).on 'turbolinks:load', ->
  $('#item_quantity').on 'change', ->
    quantity = $(this).val()
    if quantity > 0
      console.log quantity
      $('#item_available').attr('readonly', false)
    else
      $('#item_available').attr('readonly', 'readonly')