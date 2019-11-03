require 'active_support/inflector'
require 'json'
require 'date'
require 'byebug'

Dir['./**/*.rb'].each { |f| require f unless f == './main.rb' }

def main
  FileCreator.new.process(rentals: [:id,
                                    :options,
                                    { actions: %i[who type amount] }])
end

seed
main
