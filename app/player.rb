require_relative "blackjack"

class Player
  attr_accessor :cards, :name

  def initialize(args)
    @name = args[:name]
    @cards = []
  end

  def bust?
    total > 21
  end

  def total
    Blackjack.total(@cards)
  end

end