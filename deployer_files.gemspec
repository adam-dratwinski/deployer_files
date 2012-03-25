# -*- encoding: utf-8 -*-
require File.expand_path('../lib/deployer_files/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Dratwinski"]
  gem.email         = ["adam.dratwinski@gmail.com"]
  gem.description   = "Useful generators for creating files needed to deployment in way Ryan Bytes shows in his Railscasts."
  gem.summary       = "Useful generators for creating files needed to deployment in way Ryan Bytes shows in his Railscasts."
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "deployer_files"
  gem.require_paths = ["lib"]
  gem.version       = DeployerFiles::VERSION
end
