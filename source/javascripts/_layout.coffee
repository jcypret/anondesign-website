$ ->
  $('.anchor-scroll').click (e) ->
    e.preventDefault()
    anchor = $(this).attr('href')
    $(anchor).scrollToBySpeed()

  if Modernizr.touch || Modernizr.svg == false
    $.backstretch $('.background-video').data('fallback-image')
    $('.background-video').remove()
