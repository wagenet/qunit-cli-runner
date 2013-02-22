# -*- encoding: utf-8 -*-
require File.expand_path('../lib/qunit-cli-runner/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Peter Wagenet"]
  gem.email         = ["peter.wagenet@gmail.com"]
  gem.description   = "CLI Runner for QUnit tests"
  gem.summary       = "Use PhantomJS to run your QUnit tests in the CLI"
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "qunit-cli-runner"
  gem.require_paths = ["lib"]
  gem.version       = QunitCliRunner::VERSION

  gem.add_dependency "colored"
end

