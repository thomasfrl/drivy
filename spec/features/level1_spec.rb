require File.expand_path('./final_result.rb', __dir__)

RSpec.describe 'level 1' do
  include_examples 'FinalResult', 1, :Car, :Rental
end
