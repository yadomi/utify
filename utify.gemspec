# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utify/version'

Gem::Specification.new do |spec|
  spec.name          = "utify"
  spec.version       = Version::VERSION
  spec.authors       = ["Felix Yadomi"]
  spec.email         = ["dev.yadomi@gmail.com"]
  spec.summary       = %q{Download each song from a Spotify playlist using YouTube}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rspotify", "~>1.11"
  spec.add_dependency "youtube_search", "~>0.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
