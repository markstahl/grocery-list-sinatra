class Grocery

  attr_reader :name

  def initialize(name)
    @name = name

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.count
    all.count
  end

  end
end
