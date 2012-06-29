# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pludoni-capistrano/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Stefan Wienert"]
  gem.email         = ["stefan.wienert@pludoni.de"]
  gem.description   = %q{Some common tasks for capistrano}
  gem.summary       = %q{Some common tasks for capistrano}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "pludoni-capistrano"
  gem.require_paths = ["lib"]
  gem.version       = Pludoni::Capistrano::VERSION
  gem.add_runtime_dependency "capistrano_colors"
  gem.add_runtime_dependency "capistrano"
end
