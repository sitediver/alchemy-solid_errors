# This file is copied to spec/ when you run 'rails generate rspec:install'
require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require_relative "dummy/config/environment"
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "capybara/rails"
require "rspec/rails"
require "factory_bot"

require "alchemy/test_support"
require "alchemy/test_support/capybara_helpers"
require "alchemy/test_support/integration_helpers"
require "alchemy/devise/test_support/factories"

Capybara.default_selector = :css
Capybara.ignore_hidden_elements = false

FactoryBot.definition_file_paths.append(Alchemy::TestSupport.factories_path)
FactoryBot.find_definitions

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.include Alchemy::Engine.routes.url_helpers

  [:controller, :system, :request].each do |type|
    config.include Alchemy::TestSupport::IntegrationHelpers, type: type
  end
  config.include FactoryBot::Syntax::Methods
  config.include Alchemy::TestSupport::CapybaraHelpers, type: :system

  config.use_transactional_fixtures = true

  # All specs are running in transactions, but feature specs not.
  config.before(:each) do
    ::I18n.locale = :en
  end

  config.around(:each, silence_deprecations: true) do |example|
    Alchemy::Deprecation.silence do
      example.run
    end
  end

  config.before(:each, type: :system) do |example|
    screen_size = example.metadata[:screen_size] || [1280, 800]
    driven_by(:selenium, using: :headless_chrome, screen_size: screen_size) do |capabilities|
      capabilities.add_argument("--disable-search-engine-choice-screen")
    end
  end
end
