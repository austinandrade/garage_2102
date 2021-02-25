class Owner
  attr_reader :name, :occupation, :cars
  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def buy(car)
    @cars << car
    car
  end

  def vintage_cars
    @cars.select do |car|
      car if car.info[:year].to_i + 25 < 2021
    end
  end
end
