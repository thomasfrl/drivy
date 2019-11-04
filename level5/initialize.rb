def initialize_app
  require 'json'
  require 'date'
  require 'bundler/setup'
  Bundler.require
  require 'active_support/inflector'
  
  path = File.expand_path(__dir__)
  Dir["#{path}/**/*.rb"].each { |f| require f unless f =~ %r{\/main.rb$} }
end
