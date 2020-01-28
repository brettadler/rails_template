class MyApp

  ping: (ping_type) ->
    if ping_type == "alert"
      alert("Ping")
    else
      console.log("Ping")

  # track: (event) ->
  #   if typeof mixpanel != 'undefined'
  #     mixpanel.track event

  scrollToAnchor: (anchor) ->
    aTag = $(anchor)
    navbarHeight = $('nav.fixed-top').outerHeight()
    offset = aTag.offset().top - navbarHeight - 20
    $('html,body').animate { scrollTop: offset }, 'slow'

  clickableRows: (table_id) ->
    $(table_id).on 'click-row.bs.table', (row, $element, fieldt) ->
      url = $element['_data']['url']
      window.location = url

  clickableCells: (table_id) ->
    $(table_id).on 'click-cell.bs.table', (e, field, value, row, $element) ->
      if $($element).hasClass('pointer')
        window.location = row['_data']['url']

  readyFlashes: ->
    setTimeout (->
      $('.flash-alerts-wrapper .alert-success, .flash-alerts-wrapper .alert-info').fadeOut()
      return
    ), 5000

window.MyApp = new MyApp
