# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require 'hash_from_xml'

Rails.backtrace_cleaner.remove_silencers!

class ActionView::TestCase
  def assert_equal_segment(first, second)
    assert_equal Hash.from_xml(first),  Hash.from_xml(second)
  end
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
