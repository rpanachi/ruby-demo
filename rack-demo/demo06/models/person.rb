class Person
  attr_accessor :id, :name, :age

  def initialize(id, name, age)
    @id   = id
    @name = name
    @age  = age
  end

  def self.all
    [
      Person.new(1, "Bob", 30),
      Person.new(2, "Alice", 22),
      Person.new(3, "Matz", 50)
    ]
  end
end
