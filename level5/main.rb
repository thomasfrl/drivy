require 'active_support/inflector'
require 'json'
require 'date'

require './lib/model'
Dir['./**/*.rb'].each { |f| require f }

seed

def main
  FileCreator.new.process(rentals: [:id,
                                    :options,
                                    { actions: %i[who type amount] }])
end

main
