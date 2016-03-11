require 'dotenv'
Dotenv.load

set :images_dir, 'images'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :partials_dir, 'partials'

activate :title, site: 'Anonymous Design'

set :url_root, 'https://anondesign.co'
activate :search_engine_sitemap

sprockets.append_path File.join(root, 'bower_components')

activate :directory_indexes
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', '> 1%']
  config.ignore = ['fonts/*']
end

require 'helpers/custom_helpers'
helpers CustomHelpers

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css, ignore: ['fonts/*']
  activate :minify_javascript
  activate :asset_hash, ignore: ['videos/*', 'fonts/*']
  activate :relative_assets
  activate :gzip
end
