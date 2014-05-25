module CustomHelpers

  def svg_tag(svg_file, options = {})
    options = { data: { no_retina: true } }.deep_merge(options)
    image_tag svg_file, options
  end

end
