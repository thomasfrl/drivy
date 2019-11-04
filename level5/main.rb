require File.expand_path('initialize.rb', __dir__)
initialize_app

def main
  FileCreator.new.process(rentals: [:id,
                                    :options,
                                    { actions: %i[who type amount] }])
end

seed
main
