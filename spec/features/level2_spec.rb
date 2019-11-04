require File.expand_path('./final_result.rb', __dir__)

RSpec.describe 'level 2' do
  include_examples 'FinalResult', 2, :Car, :Rental
end
