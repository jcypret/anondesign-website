setFullHeightDiv = ->
  $('html').height(window.innerHeight)

$ ->
  setFullHeightDiv()

  $('.anchor-scroll').click (e) ->
    e.preventDefault()
    anchor = $(this).attr('href')
    $(anchor).scrollToBySpeed()


  # if Modernizr.touch || Modernizr.svg == false
  #   # remove video and replace with image
  #   $('video').replaceWith('<div class="background-image">')

$(window).resize ->
  setFullHeightDiv()
