require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/boat'
require './lib/renter'

class DockTest < Minitest::Test
  def test_dock_exists
    dock = Dock.new('The Rowing Dock', 3)

    assert_instance_of Dock, dock
  end

  def test_dock_can_have_attributes
    dock = Dock.new('The Rowing Dock', 3)

    assert_equal 'The Rowing Dock', dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_dock_can_rent_boats_to_renters
    dock = Dock.new('The Rowing Dock', 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)

    assert_includes(dock.rental_log, kayak_1)
  end

  def test_charge_method
    dock = Dock.new('The Rowing Dock', 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)

    kayak_1.add_hour
    kayak_1.add_hour

    assert_equal 40, dock.charge(kayak_1)[:amount]

    sup_1.add_hour
    sup_1.add_hour
    sup_1.add_hour
    # After 3 hours no charge
    sup_1.add_hour
    sup_1.add_hour

    assert_equal 45, dock.charge(sup_1)[:amount]
  end
end
