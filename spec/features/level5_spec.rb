require File.expand_path('./final_result.rb', __dir__)

RSpec.describe 'level 5' do
  include_examples 'FinalResult', 5, :Car, :Rental, :Action, :Equipement, :Option, :Owner, :Driver, :Drivy, :Insurance, :Assistance
end
