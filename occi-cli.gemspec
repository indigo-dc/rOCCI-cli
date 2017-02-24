# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'occi/cli/version'

Gem::Specification.new do |gem|
  gem.name          = "occi-cli"
  gem.version       = Occi::Cli::VERSION
  gem.authors       = ["Florian Feldhaus","Piotr Kasprzak", "Boris Parak"]
  gem.email         = ['florian.feldhaus@gmail.com', 'piotr.kasprzak@gwdg.de', 'parak@cesnet.cz']
  gem.description   = %q{This gem is a client implementation of the Open Cloud Computing Interface in Ruby}
  gem.summary       = %q{Executable OCCI client}
  gem.homepage      = 'https://github.com/EGI-FCTF/rOCCI-cli'
  gem.license       = 'Apache License, Version 2.0'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec}/*`.split("\n")
  gem.require_paths = ['lib']

  gem.add_dependency 'occi-api', '>= 4.3.11', '< 5'
  gem.add_dependency 'json', '>= 1.8.1', '< 3'
  gem.add_dependency 'highline', '>= 1.6.21', '< 2'
  gem.add_dependency 'activesupport', '>= 4.0.0', '< 5'

  gem.add_development_dependency 'bundler', '>= 1.12', '< 2'
  gem.add_development_dependency 'rubygems-tasks', '>= 0.2.4', '< 0.3'
  gem.add_development_dependency 'rspec', '>= 3.5.0', '< 4'
  gem.add_development_dependency 'rake', '>= 12', '< 13'
  gem.add_development_dependency 'simplecov', '>= 0.13', '< 1'
  gem.add_development_dependency 'yard', '>= 0.9.8', '< 1'
  gem.add_development_dependency 'yard-rspec', '>= 0.1', '< 1'
  gem.add_development_dependency 'pry', '>= 0.10.4', '< 1'

  gem.required_ruby_version = ">= 1.9.3"
end
