require 'active_support/inflector'
require 'json'
require 'date'

require './lib/model'
require './lib/models/no_db.rb'
Dir['./**/*.rb'].each { |f| require f }

seed

def main
  FileCreator.new(Rental, 'id', 'options', 'actions').process
end

main
