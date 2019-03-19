require_relative "./lib/sensibo/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Eugene Howe"]
  gem.email         = ["eugene@xtreme-computers.net"]
  gem.description   = %q{}
  gem.summary       = %q{}
  gem.homepage      = "https://github.com/ehowe/sensibo-api.git"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sensibo-api"
  gem.require_paths = ["lib"]
  gem.version       = Sensibo::VERSION

  gem.add_dependency "awesome_print",      "~> 1.8"
  gem.add_dependency "cistern",            "~> 2.8"
  gem.add_dependency "excon",              "~> 0.45"
  gem.add_dependency "faraday",            "~> 0.15"
  gem.add_dependency "faraday_middleware", "~> 0.13"
  gem.add_dependency "oj",                 "~> 3.6"

  gem.add_development_dependency "byebug",     "~> 11.0"
  gem.add_development_dependency "dotenv",     "~> 2.7"
  gem.add_development_dependency "pry-byebug", "~> 3.7"
  gem.add_development_dependency "rspec",      "~> 3.8"
end
