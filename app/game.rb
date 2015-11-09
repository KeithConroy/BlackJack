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
    args[:players].times {|i| @players << Player.new({name: "Player#{i+1}", dealer: @dealer})}

    @card_count = 0
  end

  def deal
    @cards.shuffle!

    card = @cards.pop
    @card_count += Blackjack.count_cards(card)
    @dealer.cards << card

    @players.each do |player|
      2.times do
        card = @cards.pop
        @card_count += Blackjack.count_cards(card)
        player.cards << card
      end
    end
  end

  def hit(player)
    card = @cards.pop
    @card_count += Blackjack.count_cards(card)
    player.cards << card
  end

  def highest_score
    in_it = @players.select {|player| !player.bust?}
    in_it.max_by{|player| player.total}.total
  end

  def winner
    everyone = [@dealer, @players].flatten
    in_it = everyone.select {|player| !player.bust?}
    in_it.max_by{|player| player.total}
  end

end