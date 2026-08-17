require 'test_helper'

class LazyLoadTest < ActiveSupport::TestCase
  test "the view helper is included into ActionView::Base" do
    assert_includes ActionView::Base.included_modules, Metamagic::ViewHelper
  end

  test "requiring metamagic does not load ActionView::Base" do
    # `defined?(ActionView::Base)` returns "constant" for a merely registered
    # autoload, so laziness has to be checked with `autoload?`. And this process
    # has already booted the dummy app, which loads ActionView::Base, so the
    # check has to happen in a fresh process.
    assert_subprocess_ok <<~'RUBY'
      require "rails"
      require "action_view/railtie"
      require "metamagic"

      abort "Metamagic::Railtie was not loaded" unless defined?(Metamagic::Railtie)
      abort "requiring metamagic loaded ActionView::Base" unless ActionView.autoload?(:Base)
      print "ok"
    RUBY
  end

  test "metamagic can be required without Rails" do
    assert_subprocess_ok <<~'RUBY'
      require "metamagic"

      abort "Rails was loaded" if defined?(Rails)
      abort "ActionView was loaded" if defined?(ActionView)
      abort "Railtie was loaded" if defined?(Metamagic::Railtie)
      abort "Renderer missing" unless Metamagic::Renderer.tag_types.key?(:og)
      print "ok"
    RUBY
  end

  private

  def assert_subprocess_ok(script)
    lib = File.expand_path("../lib", __dir__)
    output = IO.popen([RbConfig.ruby, "-I", lib, "-e", script], err: [:child, :out], &:read)

    assert $?.success?, "subprocess failed: #{output}"
    assert_equal "ok", output
  end
end
