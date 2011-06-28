# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates_as_uri/version"

Gem::Specification.new do |s|
  s.name        = "validates_as_uri"
  s.version     = ValidatesAsUri::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gabriel Sobrinho"]
  s.email       = ["gabriel.sobrinho@gmail.com"]
  s.homepage    = "http://github.com/sobrinho/validates_as_uri"
  s.summary     = %q{URI validation for ActiveModel}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activemodel', '>= 3.0'
  s.add_development_dependency 'rake', '>= 0.8.7'
end
