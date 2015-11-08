require "spec_helper"

describe Deck do
  let(:deck){ Deck.new }
  let(:cards) {
    [
      ["2","3","4","5","6","7","8","9","10","J","K","Q","A"],
      ["2","3","4","5","6","7","8","9","10","J","K","Q","A"],
      ["2","3","4","5","6","7","8","9","10","J","K","Q","A"],
      ["2","3","4","5","6","7","8","9","10","J","K","Q","A"],
    ].flatten
  }

  context "#initialize" do
    it "should be a Deck" do
      expect(deck).to be_a(Deck)
    end
    it "should have an array of cards" do
      expect(deck.cards).to eq(cards)
    end
    it "should have 52 cards" do
      expect(deck.cards.count).to eq 52
    end
  end
end