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

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'anondesign.co'
  s3_sync.after_build = true
end
caching_policy 'text/html', max_age: 0, must_revalidate: true

activate :cloudfront do |cf|
  cf.access_key_id = ENV['AWS_ACCESS_KEY_ID']
  cf.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  cf.distribution_id = ENV['AWS_CLOUDFRONT_ID']
  cf.filter = /\.html$/i
  cf.after_build = true
end

after_s3_sync do |files_by_status|
  invalidate files_by_status[:updated]
end
