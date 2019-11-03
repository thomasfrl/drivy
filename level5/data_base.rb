# data base
class DataBase
  def self.direction
    './data/input.json'
  end

  def self.file
    File.read(direction)
  end

  def self.load
    JSON.parse(file).each do |model_name, data|
      model = Object.const_get(model_name.to_s.singularize.capitalize)
      data.each do |attributes|
        model.new(attributes)
      end
    end
  end
end
