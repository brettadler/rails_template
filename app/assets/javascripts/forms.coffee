MyApp.format_fields = ->
  $("input.tel").mask("(999) 999-9999")
  $("input.mask-zip").mask("99999")
  $('.datepicker input').datepicker()
  $('.dollar-amount input').numeric
    decimalPlaces: 2
    negative: false
  $('.integer-amount input').numeric
    decimalPlaces: 0
    negative: false
  return

MyApp.format_tables = ->
  if $('.bootstrap-table').length == 0
    $('.table').bootstrapTable()
  return

MyApp.setTabsNavigation = ->
  $('.nav-pills .nav-link, .nav-tabs .nav-lin').click ->
    section = $(this).attr('data-section')
    $('.tab-section').hide()
    $('.nav-link').removeClass 'active'
    $(this).addClass 'active'
    $(section).show()
    return
  return
