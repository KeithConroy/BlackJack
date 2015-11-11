class View
  def show_table(game)
    system "clear"
    puts ""

    player_info(game.dealer)

    game.players.each do |player|
      player_info(player)
    end

    puts "Card Count"
    if game.card_count > 0
      puts "+#{game.card_count}"
    else
      puts game.card_count
    end
    puts ""
    puts "Cards Used: #{game.used}"
    puts "Cards Left: #{game.cards.count}"
    puts "Cards Left: #{game.cards}"
  end

  def player_info(player)
    score = ""
    if player.bust?
      score = "\e[31mBUST\e[0m"
    end
    if player.blackjack?
      score = "\e[32mBlackJack\e[0m"
    end
    puts player.name
    puts "Cards: #{player.cards}"
    puts "Total:  #{player.total} #{score}"
    puts ""
  end

  def stay(player)
    puts "#{player.name} stays"
  end

  def bust(player)
    puts "#{player.name} busts"
  end

  def hit(player)
    puts "#{player.name} hits"
  end

  def winner(player)
    puts "#{player.name} wins"
  end

  def play_again?
    puts "Would you like to play again?"
    puts "Y/N"
    return gets.chomp
  end

  def game_over
    puts "Thanks for playing!"
  end
end