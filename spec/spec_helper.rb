require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
require 'simplecov'
require 'coveralls'
require 'codeclimate-test-reporter'
include RspecPuppetFacts

# https://coveralls.zendesk.com/hc/en-us/articles/201769485-Ruby-Rails
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '/spec/fixtures'
end
# Coveralls.wear!

CodeClimate::TestReporter.start
