require 'pry'
class Garage
  attr_reader :name, :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(name)
    @customers << name
  end

  def all_cars
    all_cars = []
    @customers.each do |customer|
      customer.cars.each do |car|
        all_cars << car
      end
    end
    all_cars
  end

  def cars_by_make
    cars_by_make_hash = {
      "Ford" => [],
      "Chevrolet" => [],
      "Volvo" => []
    }
    @customers.each do |customer|
      customer.cars.select do |car|
      end
    end
  end
end
