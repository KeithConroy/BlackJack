require_relative "app/game"
require_relative "app/view"

@game = Game.new({decks: 1, players: 7})
@view = View.new

def play
  @game.deal

  @view.show_table(@game)

  @game.players.each do |player|
    until player.stay? || player.bust?
      if player.stay? || player.bust?
        @view.stay(player)
        sleep 1
        # next
      else
        sleep 1
        @game.hit(player)
        @view.show_table(@game)
        @view.hit(player)
      end

    end
    sleep 1
    @view.show_table(@game)
    if player.bust?
      @view.bust(player)
    else
      @view.stay(player)
    end
  end

  if @game.highest_score
    until @game.dealer.total >= @game.highest_score
      sleep 1
      @game.hit(@game.dealer)
      @view.show_table(@game)
      @view.hit(@game.dealer)
    end
    @view.winner(@game.winner)
  else
    @view.winner(@game.dealer)
  end

  play_again? ? play : @view.game_over
end

def play_again?
  y_or_n = @view.play_again?
  case y_or_n.downcase
  when "y"
    return true
  when "n"
    return false
  else
    play_again?
  end
end

play