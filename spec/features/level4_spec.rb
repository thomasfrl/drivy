require File.expand_path('./final_result.rb', __dir__)

RSpec.describe 'level 4' do
  include_examples 'FinalResult', 4, :Car, :Rental, :Action, :Owner, :Driver, :Drivy, :Insurance, :Assistance, :Creditor
end
