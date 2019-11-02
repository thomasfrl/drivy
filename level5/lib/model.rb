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

  def self.where(options)
    all.select do |instance|
      options.all? do |attr_name, attr_value|
        instance.instance_variable_get("@#{attr_name}") == attr_value
      end
    end
  end

  def self.belongs_to(model_name, key = "#{model_name}_id")
    define_method model_name do
      Object.const_get(model_name.capitalize).find(send(key))
    end
  end

  def self.has_many(model_name, **options)
    foreign_key = options[:foreign_key] || "#{model_name}_id"
    key         = options[:key] || 'id'
    conditions  = { foreign_key.to_sym => key }

    define_method model_name do
      Object.const_get(model_name.singularize.capitalize).where(*conditions)
    end
  end
end
