setFullHeightDiv = ->
  $('html').height(window.innerHeight)

$ ->
  $('.anchor-scroll').click (e) ->
    e.preventDefault()
    anchor = $(this).attr('href')
    $(anchor).scrollToBySpeed()

  setFullHeightDiv()

  if Modernizr.touch || Modernizr.svg == false
    # remove video and replace with image
    $('video').replaceWith('<div class="background-image">')

$(window).resize ->
  setFullHeightDiv()
