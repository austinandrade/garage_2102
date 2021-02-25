require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'

class OwnerTest < Minitest::Test
  def setup
    @owner_1 = Owner.new('Regina George', 'Heiress')
  end

  def test_it_exists
    assert_instance_of Owner, @owner_1
  end

  def test_it_has_attributes
    assert_equal "Regina George", @owner_1.name
    assert_equal "Heiress", @owner_1.occupation
    assert_equal [], @owner_1.cars
  end

  def test_it_can_buy
    car_1 = Car.new({description: 'Green Ford Mustang', year: '1967'})
    car_2 = Car.new({description: 'Silver BMW 3-Series', year: '2001'})
    car_3 = Car.new({description: 'Red Chevrolet Corvette', year: '1963'})

    assert_equal car_1, @owner_1.buy(car_1)
    assert_equal [car_1], @owner_1.cars
    assert_equal car_2, @owner_1.buy(car_2)
    assert_equal [car_1, car_2], @owner_1.cars
    assert_equal car_3, @owner_1.buy(car_3)
    assert_equal [car_1, car_3], @owner_1.vintage_cars
  end
end
