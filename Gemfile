source 'https://rubygems.org'

# Specify your gem's dependencies in metamagic.gemspec
gemspec

# CI runs the test suite against several Rails versions. Set RAILS_VERSION to
# e.g. "8.0" to pin Rails to that minor series; without it, the newest Rails
# allowed by the gemspec is used.
if (rails_version = ENV["RAILS_VERSION"])
  gem "rails", "~> #{rails_version}.0"
end
