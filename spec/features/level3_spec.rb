require File.expand_path('./final_result.rb', __dir__)

RSpec.describe 'level 3' do
  include_examples 'FinalResult', 3, :Car, :Rental
end
