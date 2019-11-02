require 'active_support/inflector'
require 'json'
require 'date'

Dir['./**/*.rb'].each { |f| require f }

def main
  FileCreator.new(Rental, 'id', 'actions').process
end

main
