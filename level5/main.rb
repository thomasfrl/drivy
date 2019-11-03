require 'active_support/inflector'
require 'json'
require 'date'

Dir['./**/*.rb'].each { |f| require f }

seed

def main
  FileCreator.new.process(rentals: [:id,
                                    :options,
                                    { actions: %i[who type amount] }])
end

main
