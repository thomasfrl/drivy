# file creator service
class FileCreator
  def initialize(model, *data_names)
    @file_name  = File.expand_path('../data/output.json', __dir__)
    @model      = model
    @data_names = data_names
  end

  def process
    File.open(@file_name, 'w') do |f|
      f.write({ @model.name.downcase.pluralize => compile_data }.to_json)
    end
  end

  def compile_data
    @model.all.map do |instance|
      @data_names.map do |data_name|
        [data_name, instance.send(data_name)]
      end.to_h
    end
  end
end
