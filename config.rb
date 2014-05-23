Stylus.use('jeet', 'rupture', 'axis-css', 'autoprefixer-stylus')

set :images_dir, 'images'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :fonts_dir, 'fonts'
set :partials_dir, 'partials'

activate :title
activate :directory_indexes

# Add bower_components folder to Sprockets path
sprockets.append_path File.join(root, 'bower_components')

configure :development do
	activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
end
