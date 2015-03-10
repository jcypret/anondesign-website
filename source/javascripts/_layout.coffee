setFullHeightDiv = ->
  $('html').height(window.innerHeight)

$ ->
  setFullHeightDiv()

  $('.anchor-scroll').click (e) ->
    e.preventDefault()
    anchor = $(this).attr('href')
    $(anchor).scrollToBySpeed()

$(window).resize ->
  setFullHeightDiv()
