# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'biscotti/version'

Gem::Specification.new do |spec|
  spec.name          = 'biscotti'
  spec.version       = Biscotti::VERSION
  spec.authors       = ['Mike Hall']
  spec.email         = ['mike@just3ws.com']

  spec.summary       = 'Totally not a way to cheat at letter scramble games.'
  spec.description   = 'Generate a list of possible words for a given set of letters.'
  spec.homepage      = 'https://github.com/just3ws/biscotti'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
