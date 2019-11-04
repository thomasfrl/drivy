def initialize_app(level)
  require 'json'
  require 'date'
  require 'bundler/setup'
  Bundler.require
  require 'active_support/inflector'

  path = File.expand_path("level#{level}/", __dir__)
  Dir["#{path}/**/*.rb"].each { |f| require f unless f =~ %r{\/main.rb$} }
end
