# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'republican_calendar/version'

Gem::Specification.new do |spec|
  spec.name          = "republican_calendar"
  spec.version       = RepublicanCalendar::VERSION
  spec.authors       = ["4nt1"]
  spec.email         = ["antoinemary@hotmail.fr"]
  spec.summary       = %q{use the French republican calendar}
  spec.description   = %q{The gem give the ability to use the French republican (French revolutionary) calendar.}
  spec.homepage      = "https://github.com/4nt1/republican_calendar"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
