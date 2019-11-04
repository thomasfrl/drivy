# spec/features/final_result.rb
require File.expand_path('../../initialize.rb', __dir__)

[3].each do |level|
  RSpec.describe 'FinalResult', type: :request do
    before(:all) do
      initialize_app(level)
      process
    end

    describe "check level #{level}" do
      let(:result) do
        path = "../../level#{level}/data/output.json"
        File.read(File.expand_path(path, __dir__))
      end
      let(:expected_result) do
        path = "../../level#{level}/data/expected_output.json"
        File.read(File.expand_path(path, __dir__))
      end

      it do
        expect(JSON.parse(result)).to eq(JSON.parse(expected_result))
      end
    end
  end
end
