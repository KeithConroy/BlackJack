require "spec_helper"

describe Game do
  let(:game){ Game.new({decks: 1, players: 1}) }
  let(:game2){ Game.new({decks: 2, players: 2}) }
  let(:game8){ Game.new({decks: 8, players: 8}) }

  context "#initialize" do
    it "should be a Game" do
      expect(game).to be_a(Game)
    end
    it "should have an array of cards" do
      expect(game.cards).to be_a(Array)
    end
    it "should have the right number of cards" do
      expect(game.cards.count).to eq 52
      expect(game2.cards.count).to eq 104
      expect(game8.cards.count).to eq 416
    end
    it "should have an array of players" do
      expect(game.players).to be_a(Array)
    end
    it "should have the right number of players" do
      expect(game.players.count).to eq 1
      expect(game2.players.count).to eq 2
      expect(game8.players.count).to eq 8
    end
    it "should have a card_count of 0" do
      expect(game.card_count).to eq 0
    end
  end
end