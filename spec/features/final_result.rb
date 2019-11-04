# spec/features/final_result.rb

RSpec.shared_examples 'FinalResult', type: :request do |level, *constances|
  before(:all) do
    require File.expand_path('../../initialize.rb', __dir__)
    initialize_app(level)
    process
  end

  after(:all) do
    constances.each { |const| Object.send(:remove_const, const) }
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
