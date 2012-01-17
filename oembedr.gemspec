# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "oembedr/version"

Gem::Specification.new do |s|
  s.name        = "oembedr"
  s.version     = Oembedr::VERSION
  s.authors     = ["Matt Wilson"]
  s.email       = ["mhw@hypomodern.com"]
  s.homepage    = "https://github.com/agoragames/oembedr"
  s.summary     = %q{Lightweight, Flexible OEmbed Consumer Library}
  s.description = %q{oembedr aims to make consuming oembed resources easy}

  # s.rubyforge_project = "oembedr"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "yajl-ruby"
  s.add_development_dependency "typhoeus"
  s.add_development_dependency "vcr", "~> 2.0.0.rc1"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-bundler"

  s.add_dependency "multi_json"
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"
end
