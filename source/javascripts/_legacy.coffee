$ ->
  unless Modernizr.svg
    $('img[src*="svg"]').attr 'src', ->
      $(this).data('svg-fallback')
