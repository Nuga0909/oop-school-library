require_relative 'nameable'
require_relative 'basedeco'
require_relative 'capitalizedeco'
require_relative 'trimmerdeco'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end
  
  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end
  
  private

  def of_age?
    @age >= 18
  end
end
