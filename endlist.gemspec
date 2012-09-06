lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'endlist/version'

Gem::Specification.new do |s|
  s.name        = "endlist"
  s.version     = Endlist::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tyler Love"]
  s.email       = ["t@tylr.org"]
  s.homepage    = "http://github.com/endlessinc/endlist"
  s.summary     = %q{A persistant list}
  s.description = %q{Endlist allows you to persistantly store lists of data in Ruby through the endlist API.}


  s.rubyforge_project         = "endlist"

  s.add_dependency('typhoeus', '~> 0.5.0.alpha')
  s.add_dependency('uuid', '~> 2.3.5')
  s.add_development_dependency 'bundler', '~> 1.0'
  s.add_development_dependency 'rake', '~> 0.9'
  s.add_development_dependency 'rdoc', '~> 3.9'
  s.add_development_dependency 'rspec', '~> 2.3'

  s.files = Dir.glob('lib/**/*.rb') 
end
