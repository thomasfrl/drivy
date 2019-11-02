class DataBase
  def self.direction
    './data/input.json'
  end

  def self.load(model)
    JSON.parse(File.read(self.direction))[model.name.downcase.pluralize].map do |data|
      model.new(data)
    end
  end
end