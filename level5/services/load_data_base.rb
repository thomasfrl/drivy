# load data base from json file
class LoadDataBase
  def initialize(file_name = './data/input.json')
    @file_name = file_name
  end

  def process
    JSON.parse(file).each do |model_name, data|
      model = Object.const_get(model_name.to_s.singularize.capitalize)
      data.each do |attributes|
        model.new(attributes)
      end
    end
  end

  protected

  def file
    File.read(@file_name)
  end
end
