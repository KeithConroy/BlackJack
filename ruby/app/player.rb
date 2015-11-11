require_relative "blackjack"

class Player
  attr_accessor :cards, :name

  def initialize(args)
    @name = args[:name]
    @cards = []
    @dealer = args[:dealer]
  end

  def bust?
    total > 21
  end

  def blackjack?
    total == 21
  end

  def total
    Blackjack.total(@cards)
  end

  def stay?
    if total <= 11
      return false
    elsif total <= 16
      if @dealer.total <= 6
        return true
      else
        return false
      end
    else total >= 17
      return true
    end
  end

end