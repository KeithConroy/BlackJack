module Blackjack

  def self.total(cards)
    total = 0
    cards.each do |card|
      if card == "A"
        total += 11
      elsif ["J","K","Q"].include?(card)
        total += 10
      else
        total += card.to_i
      end
    end
    if total > 21 && cards.include?("A")
      ace_index = cards.index("A")
      cards.delete_at(ace_index)
      total = total(cards) +1
    end
    return total
  end

  def self.count_cards(card)
    if ["2","3","4","5","6"].include?(card)
      return 1
    elsif ["7","8","9"].include?(card)
      return 0
    elsif ["10","J","K","Q","A"].include?(card)
      return -1
    end
  end

end