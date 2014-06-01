supportsSVG = ->
  !!document.createElementNS and !!document.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect

$ ->
  unless supportsSVG
    $('img[src*="svg"]').attr 'src', ->
      $(this).data('svg-fallback')
