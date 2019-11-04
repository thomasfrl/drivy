# spec/features/final_result.rb
require File.expand_path('../../level5/initialize.rb', __dir__)

initialize_app

RSpec.describe 'FinalResult', type: :request do
  before do
    seed
    FileCreator.new.process(rentals: [:id,
                                      :options,
                                      { actions: %i[who type amount] }])
  end

  describe 'check smth' do
    let(:result) do
      path = '../../level5/data/output.json'
      File.read(File.expand_path(path, __dir__))
    end
    let(:expected_result) do
      path = '../../level5/data/expected_output.json'
      File.read(File.expand_path(path, __dir__))
    end

    it do
      expect(JSON.parse(result)).to eq(JSON.parse(expected_result))
    end
  end
end
