# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'brainshell/version'

Gem::Specification.new do |spec|
  spec.name          = 'brainshell'
  spec.version       = Brainshell::VERSION
  spec.authors       = ['koss']
  spec.email         = ['koss.lebedev@gmail.com']

  spec.summary       = %q{Console client for accessing Braintree payment gateway}
  spec.description   = %q{Console client for accessing Braintree payment gateway}
  spec.homepage      = 'https://github.com/koss-lebedev/brainshell'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['brainshell']
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.19.1'
  spec.add_dependency 'braintree', '2.60.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
