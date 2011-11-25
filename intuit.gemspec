# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "intuit/version"

Gem::Specification.new do |s|
  s.name        = "intuit"
  s.version     = Intuit::VERSION
  s.authors     = ["Eugene Bolshakov"]
  s.email       = ["eugene.bolshakov@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "intuit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "turn"
  s.add_development_dependency "mocha"
  s.add_runtime_dependency "i18n"
  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "oauth"
  s.add_runtime_dependency "happymapper"
  s.add_runtime_dependency "nokogiri"
end
