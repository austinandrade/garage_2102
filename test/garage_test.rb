require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'
require './lib/garage'

class GarageTest < Minitest::Test
  def setup
    @garage = Garage.new('Totally Safe Parking')
    @owner_1 = Owner.new('Regina George', 'Heiress')
    @owner_2 = Owner.new('Glen Coco', 'Unknown')
    @car_1 = Car.new({description: 'Green Ford Mustang', year: '1967'})
    @car_2 = Car.new({description: 'Blue Ford Escape', year: '2001'})
    @car_3 = Car.new({description: 'Green Chevrolet Corvette', year: '1963'})
    @car_4 = Car.new({description: 'Silver Volvo XC90', year: '2020'})
  end

  def test_it_exists
    assert_instance_of Garage, @garage
  end

  def test_it_has_name
    assert_equal "Totally Safe Parking", @garage.name
  end

  def test_can_add_customer
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal [@owner_1, @owner_2], @garage.customers
  end

  def test_all_cars
    @owner_1.buy(@car_1)
    @owner_1.buy(@car_2)
    @owner_2.buy(@car_3)
    @owner_2.buy(@car_4)
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal [@car_1, @car_2, @car_3, @car_4], @garage.all_cars
  end

  def test_cars_by_make
    @owner_1.buy(@car_1)
    @owner_1.buy(@car_2)
    @owner_2.buy(@car_3)
    @owner_2.buy(@car_4)
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal (
                 {
                  "Ford" => [@car_1, @car_2],
                  "Chevrolet" => [@car_3],
                  "Volvo" => [@car_4]
                 }
                 ), @garage.cars_by_make
  end
end
