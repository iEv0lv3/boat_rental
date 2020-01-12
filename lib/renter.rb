class Renter
  attr_reader :name, :credit_card_number

  def initialize(name, card_number)
    @name = name
    @credit_card_number = card_number
  end
end
