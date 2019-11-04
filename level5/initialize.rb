def initialize_app
  require 'active_support/inflector'
  require 'json'
  require 'date'
  require 'bundler/setup'
  Bundler.require

  path = File.expand_path(__dir__)
  Dir["#{path}/**/*.rb"].each { |f| require f unless f =~ %r{\/main.rb$} }
end
