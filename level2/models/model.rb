# model core
class Model
  attr_reader :id

  def initialize(options)
    options.each do |attr_name, attr_value|
      instance_variable_set("@#{attr_name}", attr_value)
    end
  end

  def self.all
    @all ||= DataBase.load(self)
  end

  def self.find(id)
    all.find { |model| model.id == id }
  end
end
