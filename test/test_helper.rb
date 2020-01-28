ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'simplecov'
SimpleCov.start 'rails'

require "minitest/rails"
require "minitest/focus"
require "minitest/reporters"
Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new,
  Minitest::Reporters::HtmlReporter.new
]

require 'faker'
# require 'webmock/minitest'
# require 'mocha/setup'
# require 'mocha/mini_test'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

class ActiveSupport::TestCase

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  def assert_authentication_failed
    assert_response :found
    assert_redirected_to new_user_session_path
  end

  def assert_authorization_failed
    assert_response :redirect
    assert_redirected_to root_path
  end

  def assert_authorization(user, target_path)
    sign_in user
    get target_path
    assert :success
  end

  def assert_redirection(user, target_path, redirected_to)
    sign_in user
    get target_path
    assert_response :redirect
    assert_redirected_to redirected_to
  end

  def assert_saved(object)
    debug_errors(object) unless object.save
  end

  def debug(message)
    puts ""
    puts "================================================"
    puts "============================================================================================================"
    puts message
    puts "============================================================================================================"
    puts "================================================"
    puts ""
  end

  def debug_errors(object)
    debug(object.errors.full_messages)
  end

end

# class ActionDispatch::IntegrationTest
#   include Devise::Test::IntegrationHelpers
# end
