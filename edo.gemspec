# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edo/version'

Gem::Specification.new do |spec|
  spec.name          = "edo"
  spec.version       = Edo::VERSION
  spec.authors       = ["Bodacious"]
  spec.email         = ["gavin@gavinmorrice.com"]

  spec.summary       = %q{Internal code-police}
  spec.description   = <<~DESC
    Write better code–together–by using these reports to make sure
    the changes you're committing are healthy. Includes Brakeman, RubyCritic, Rubocop and
    SandiMeter
  DESC
  spec.homepage      = "http://github.com/bodacious/edo"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sandi_meter"
  spec.add_dependency "rubycritic"
  spec.add_dependency "rubocop"
  spec.add_dependency "brakeman"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
