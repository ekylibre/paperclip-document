lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip/document/version'

Gem::Specification.new do |spec|
  spec.name          = "paperclip-document"
  spec.version       = Paperclip::Document::VERSION
  spec.authors       = ["Brice Texier"]
  spec.email         = ["burisu@oneiros.fr"]
  spec.summary       = %q{Processors for paperclip}
  spec.homepage      = "http://github.com/burisu/paperclip-document"
  spec.license       = "MIT"

  spec.files         = `git ls-files lib LICENSE.txt README.md`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "paperclip", ">= 3.1", "< 5.2"
  spec.add_dependency "burisu-docsplit", "> 0.7.7"
  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency 'rails', ">= 3.2"
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'minitest'
end
