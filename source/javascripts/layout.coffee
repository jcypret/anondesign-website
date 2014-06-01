$ ->
  $('.anchor-scroll')
  $('.anchor-scroll').click (e) ->
    e.preventDefault()
    anchor = $(this).attr('href')
    $(anchor).scrollToBySpeed()
