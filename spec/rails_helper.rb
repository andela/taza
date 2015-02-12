# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

#require 'factory_girl_rails'
#require 'devise'
require 'selenium-webdriver'
require 'capybara/rails'
require 'capybara/rspec'

# require all rb files in the support directory
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

# require_relative 'support/devise_support'
# Require fixture builder for auto generating fixtures
# require_relative 'support/fixture_builder'

Capybara.javascript_driver = :webkit
Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 180         # 3 minutes

  Capybara::Selenium::Driver.new(app, :browser => :firefox, :http_client => http_client)

end


RSpec.configure do |config|
  config.render_views
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # Factory Girls Configuration
  # config.include FactoryGirl::Syntax::Methods
  # config.include Devise::TestHelpers, type: :controller

  # config.include DeviseSupport

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  config.after :each do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.global_fixtures = :all
  config.infer_spec_type_from_file_location!
end