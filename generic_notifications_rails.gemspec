$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "generic_notifications_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "generic_notifications_rails"
  s.version     = GenericNotificationsRails::VERSION
  s.authors     = ["Daniel Staudigel", "Brian J. Fox"]
  s.email       = ["dstaudigel@opuslogica.com", "bfox@opuslogica.com"]
  s.homepage    = "http://opuslogica.com/"
  s.summary     = "GenericNotificationsRails: Adds the ability to create/dispatch notifications to people."
  s.description = "GenericNotificationsRails: See summary."
  s.license     = "OLI"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4"

  s.add_development_dependency "sqlite3"
end
