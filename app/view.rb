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
  end

  def player_info(player)
    puts player.name
    puts "Cards: #{player.cards}"
    puts "Total:  #{player.total}"
    if player.bust?
      puts "\e[31mBUST\e[0m"
    end
    if player.blackjack?
      puts "\e[32mBlackJack\e[0m"
    end
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
end