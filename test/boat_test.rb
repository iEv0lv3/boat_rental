require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'

class BoatTest < Minitest::Test
  def test_boat_exists
    boat = Boat.new(:kayak, 20)

    assert_instance_of Boat, boat
  end

  def test_boat_can_have_attributes
    kayak = Boat.new(:kayak, 20)

    assert_equal :kayak, kayak.type
    assert_equal 20, kayak.price_per_hour
  end

  def test_hours_rented
    kayak = Boat.new(:kayak, 20)

    assert_equal 0, kayak.hours_rented
  end

  def test_add_hour_method
    kayak = Boat.new(:kayak, 20)
    kayak.add_hour
    kayak.add_hour
    kayak.add_hour

    assert_equal 3, kayak.hours_rented
  end
end
