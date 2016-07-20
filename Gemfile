source ENV['GEM_SOURCE'] || "https://rubygems.org"

group :test do
  gem 'puppetlabs_spec_helper'
  gem 'rspec-puppet'
  gem 'rspec-puppet-facts'
  gem 'rspec-puppet-utils'
  gem 'metadata-json-lint'
  gem 'puppet-strings'
  gem 'rubocop-rspec'
  gem 'coveralls'
  gem 'codeclimate-test-reporter'
  gem 'puppet-lint-absolute_classname-check'
  gem 'puppet-lint-leading_zero-check'
  gem 'puppet-lint-trailing_comma-check'
  gem 'puppet-lint-version_comparison-check'
  gem 'puppet-lint-classes_and_types_beginning_with_digits-check'
  gem 'puppet-lint-unquoted_string-check'
  gem 'puppet-lint-variable_contains_upcase'
end

group :release do
  gem 'voxpupuli-release', git: 'https://github.com/voxpupuli/voxpupuli-release-gem'
  gem 'puppet-blacksmith'
end
