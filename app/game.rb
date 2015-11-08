require_relative "deck"
require_relative "player"

class Game
  attr_reader :cards, :dealer, :players, :card_count

  def initialize(args)
    decks = []
    args[:decks].times {decks << Deck.new}

    @cards = (decks.map {|deck| deck.cards}).flatten
    @dealer = Player.new
    @players = []
    args[:players].times {@players << Player.new}

    @card_count = 0
  end

  def deal
    @cards.shuffle!
    2.times do
      @dealer.cards << @cards.pop
    end
    @players.each do |player|
      2.times do
        player.cards << @cards.pop
      end
    end
  end

end