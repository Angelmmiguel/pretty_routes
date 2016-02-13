# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pretty_routes/version'

Gem::Specification.new do |gem|
  gem.name          = 'pretty_routes'
  gem.version       = PrettyRoutes::VERSION
  gem.authors       = ['Angel M de Miguel']
  gem.email         = ['angel@laux.es']
  gem.description   = 'PrettyRoutes is a Rails engine to display and interact'\
                      ' with routes of your application'
  gem.summary       = 'PrettyRoutes is a Rails engine to display and interact'\
                      ' with routes of your application'
  gem.homepage      = 'http://irb.rocks'
  gem.license       = 'MIT'

  gem.files         = Dir['{app,lib}/**/*'] + %w(Rakefile LICENSE README.md)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'rails', '>= 3.2'
  gem.add_dependency 'zeroclipboard-rails', '~> 0.1.1'

  gem.add_development_dependency 'capybara', '>= 0.4.0'
  gem.add_development_dependency 'launchy', '~> 2.1.0'
  gem.add_development_dependency 'poltergeist'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-nav'
  gem.add_development_dependency 'sqlite3'
end
