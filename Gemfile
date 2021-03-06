source 'http://rubygems.org'

# Deployment and web server
gem 'rvm-capistrano'
gem 'unicorn'

# App basics
gem 'rails','~>3.2.13'
gem 'pg'
gem 'json'
gem 'jquery-rails'
gem 'haml'
gem 'therubyracer', '0.10.1'
gem 'bluecloth'

# Image processing
gem 'rmagick'
gem 'carrierwave'

# Authentication & authorization
gem 'cancan'
gem 'omniauth'
gem "omniauth-google-oauth2"
gem "omniauth-facebook"
gem "omniauth-twitter"

# Metrics
gem 'how_slow', '0.4.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'twitter-bootstrap-rails', '2.1.1'
end

group :development do
  gem 'pry'
end

group :test do
  gem "cucumber"
  gem "cucumber-rails"
end

group :development, :cucumber, :test do
  gem "populator"
  gem "factory_girl_rails"
  gem "faker"
  gem "webrat"  
  gem "rspec-rails"
  gem "webrat"
  gem "capybara"
  gem "launchy"
  gem "database_cleaner"
  
  gem "ruby_gntp"
  gem "guard"
  gem "guard-rspec"
  gem "guard-cucumber"
end
