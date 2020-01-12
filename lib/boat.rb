class Boat
  attr_reader :type, :price_per_hour
  attr_accessor :hours_rented

  def initialize(type, price)
    @type = type
    @price_per_hour = price
    @hours_rented = 0
  end

  def add_hour
    @hours_rented += 1 if @hours_rented <= 2
  end
end
