require 'rubygems'
require 'bundler/setup'

require 'oembedr' # and any other gems you need
require 'vcr'

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :faraday
end