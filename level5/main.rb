require 'active_support/inflector'
require 'json'
require 'date'
require 'bundler/setup'
Bundler.require

path = File.expand_path(__dir__)
Dir["#{path}/**/*.rb"].each { |f| require f unless f =~ %r{\/main.rb$} }

def main
  FileCreator.new.process(rentals: [:id,
                                    :options,
                                    { actions: %i[who type amount] }])
end

seed
main
