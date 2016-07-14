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
end

group :release do
  gem 'voxpupuli-release', git: 'https://github.com/voxpupuli/voxpupuli-release-gem'
  gem 'puppet-blacksmith'
end
