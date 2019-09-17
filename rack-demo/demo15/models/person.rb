class Person < Sequel::Model
  plugin :validation_helpers

  def validate
    super
    validates_presence [:name, :age]
    validates_operator :>, 18, :age
  end
end
