Gem::Specification.new do |s|
  s.name        = "osym"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = "SOAP client GEM for ÖSYM services."
  s.description = "SOAP client GEM for ÖSYM services."
  s.author      = "Mustafa Serhat Dündar"
  s.email       = "msdundars@gmail.com"
  s.files       = ["lib/osym.rb", "lib/osym/request.rb"]
  s.homepage    = "https://github.com/msdundar/osym"
  s.licenses    = ["MIT"]
  s.add_dependency "savon", "~> 2.7.2"
end

# gem build osym.gemspec
# sudo gem install ./osym-0.1.5.gem 
# gem push osym-0.1.5.gem 
# git tag -a v0.1.5 -m "foo"
# git push --tags