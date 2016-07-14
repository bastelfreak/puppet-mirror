require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
require 'coveralls'
include RspecPuppetFacts
Coveralls.wear!


SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
    add_filter '/spec/fixtures'
end
