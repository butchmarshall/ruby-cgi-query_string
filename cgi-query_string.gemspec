# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cgi/query_string'
require 'cgi/query_string/version'

Gem::Specification.new do |spec|
	spec.name          = "cgi-query_string"
	spec.version       = CGI::QueryString::VERSION
	spec.authors       = ["Butch Marshall"]
	spec.email         = ["butch.a.marshall@gmail.com"]

	spec.summary       = %q{Helper methods for dealing with query strings in ruby.}
	spec.description   = %q{Basically trying to replicate ActiveSupports to_query method without having to include all of ActiveSupport.

Hopefully someone finds this useful.}
	spec.homepage      = "https://github.com/butchmarshall/ruby-cgi-query_string"
	spec.license       = "MIT"

	spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
	spec.bindir        = "exe"
	spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ["lib"]

	spec.add_development_dependency "bundler", "~> 1.10"
	spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency 'rspec', '~> 0'
end
