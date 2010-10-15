Gem::Specification.new do |s|
  s.name              = "validates_as_uri"
  s.version           = "0.1.0"
  s.date              = "2010-10-15"
  s.summary           = "Feed me."
  s.homepage          = "http://github.com/webhoernchen/validates_as_uri"
  s.email             = "c.eichhorn@webmasters.de"
  s.authors           = [ "Christian Eichhorn" ]
  s.has_rdoc          = false

  s.files             = %w( README.textile Rakefile MIT-LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("bin/**/*")
  s.files            += Dir.glob("man/**/*")
  s.files            += Dir.glob("test/**/*")

#  s.executables       = %w( validates_as_uri )
  s.description       = "Feed me."
end
