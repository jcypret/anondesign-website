require 'dotenv'
Dotenv.load

set :images_dir, 'images'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :partials_dir, 'partials'

activate :title, site: 'Anonymous Design'

set :url_root, 'http://anondesign.co'
activate :search_engine_sitemap

sprockets.append_path File.join(root, 'bower_components')

activate :directory_indexes
activate :autoprefixer do
  config.browsers = ['last 2 versions', '> 1%']
end

require 'helpers/custom_helpers'
helpers CustomHelpers

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash, ignore: 'videos/*'
  activate :relative_assets
  activate :gzip
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'anondesign.co'
  s3_sync.after_build = true
end
caching_policy 'text/html', max_age: 0, must_revalidate: true
