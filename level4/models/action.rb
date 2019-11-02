# action model
class Action < Model
  attr_accessor :who, :type, :amount
  @@all = []

  def initialize(options)
    super options

    @@all << self
  end

  def self.all
    @@all
  end
end
