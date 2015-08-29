require 'rubygems'
require 'bundler/setup'

require 'oembedr'
require 'vcr'

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :typhoeus
end