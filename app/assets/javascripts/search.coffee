MyApp.searchItems = (searchInput, selector) ->

  searchText = $(searchInput).val().toLowerCase()

  #show all cards if no search searchText
  if searchText.length == 0
    $(selector).show()
    return

  #split search terms
  searchTerms = searchText.split(' ')
  searchTermsCount = searchTerms.length

  #run for each row in the table
  $(selector).each ->

    searchRow = $(this)
    termsFound = 0

    $.each searchTerms, (index, value) ->
      #return a count of how many fields have this value
      fieldsWithValue = searchRow.filter(->
        searchRow.text().toLowerCase().indexOf(value) >= 0
      ).length
      if fieldsWithValue > 0
        termsFound += 1
      return

    #show row if any results are found
    if termsFound == searchTermsCount
      $(this).show()
    else
      $(this).hide()
    return

  return

MyApp.setSearchInput = (searchInput, selector) ->
  self = this
  $(searchInput).keyup ->
    self.searchItems searchInput, selector
    return
