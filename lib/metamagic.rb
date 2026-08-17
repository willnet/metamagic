require "active_support/core_ext/object/blank"
require "active_support/core_ext/string/output_safety"

%w{
  version
  tag
  tags/meta_tag
  tags/title_tag
  tags/property_tag
  tags/link_tag
  tags/custom_tag
  tags/open_graph_tag
  tags/twitter_tag
  renderer
  view_helper
}.each { |f| require "metamagic/#{f}" }

require "metamagic/railtie" if defined?(Rails::Railtie)
