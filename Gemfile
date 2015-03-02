source 'https://rubygems.org'
ruby "2.1.4"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
#use new Relic
gem 'newrelic_rpm'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'autoprefixer-rails'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Figaro to store environment secrets
gem 'figaro'

group :development do
  gem 'git-duet'
end

# Devise and google Authentication
gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'

group :development, :test do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'rspec-rails'
  gem 'capybara'
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem "codeclimate-test-reporter", require: nil
  # Use rspec for testing
  gem 'rspec'
  gem 'simplecov', :require => false
end

gem 'rails_12factor', group: :production
