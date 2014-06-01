module CustomHelpers

  def svg_tag(file_name, options = {})
    options = {
      data: {
        no_retina: true,
        svg_fallback: asset_path(:images, "#{file_name}.png")
      }
    }.deep_merge(options)
    image_tag "#{file_name}.svg", options
  end

end
