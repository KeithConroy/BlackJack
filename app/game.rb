require_relative "deck"
require_relative "player"
require_relative "blackjack"

class Game
  attr_reader :cards, :dealer, :players, :card_count

  def initialize(args = {})
    decks = []
    args[:decks].times {decks << Deck.new}

    @cards = (decks.map {|deck| deck.cards}).flatten
    @dealer = Player.new({name: "Dealer"})
    @players = []
    args[:players].times {|i| @players << Player.new({name: "Player#{i+1}"})}

    @card_count = 0
  end

  def deal
    @cards.shuffle!
    2.times do
      card = @cards.pop
      @card_count += Blackjack.count_cards(card)
      # p "count #{@card_count}"
      @dealer.cards << card
    end
    @players.each do |player|
      2.times do
        card = @cards.pop
        @card_count += Blackjack.count_cards(card)
        # p "count #{@card_count}"
        player.cards << card
      end
    end
  end

end