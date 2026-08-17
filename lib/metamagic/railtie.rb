require "active_support"
require "rails/railtie"

module Metamagic
  class Railtie < ::Rails::Railtie
    initializer "metamagic.view_helper" do
      ActiveSupport.on_load :action_view do
        include Metamagic::ViewHelper
      end
    end
  end
end
