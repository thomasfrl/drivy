require 'active_support/inflector'
require 'json'
require 'date'

Dir['./**/*.rb'].each { |f| require f }

def main
  FileCreator.new(Rental, 'id', 'price', 'commissions').process
end

main
