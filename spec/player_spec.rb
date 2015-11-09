require "spec_helper"

describe Player do
  let(:player){ Player.new({name: "Player"}) }

  context "#initialize" do
    it "should be a Player" do
      expect(player).to be_a(Player)
    end
    it "should have a name" do
      expect(player.name).to eq "Player"
    end
    it "should have a cards attribute" do
      expect(player.cards).to be_a(Array)
    end
    it "should be able to push to cards" do
      player.cards << "2"
      expect(player.cards).to eq ["2"]
    end
  end

  context "#total" do
    it "should return the players card total" do
      player.cards << "2"
      player.cards << "10"
      expect(player.total).to eq 12
      player.cards << "5"
      expect(player.total).to eq 17
      player.cards << "J"
      expect(player.total).to eq 27
    end
    context "aces" do
      it "should count as 11 if you dont bust" do
        player.cards << "A"
        player.cards << "K"
        expect(player.total).to eq 21
      end
      it "should count as 1 if you bust" do
        player.cards << "A"
        player.cards << "K"
        player.cards << "2"
        expect(player.total).to eq 13
      end
      it "should count as 11 and 1 with two aces" do
        player.cards << "A"
        player.cards << "9"
        player.cards << "A"
        expect(player.total).to eq 21
      end
      it "should count as 11 and three 1's with four aces" do
        player.cards << "A"
        player.cards << "A"
        player.cards << "A"
        player.cards << "A"
        expect(player.total).to eq 14
      end
    end
  end

  context "#bust" do
    it "should return true if player total is over 21" do
      player.cards << "2"
      player.cards << "10"
      player.cards << "5"
      player.cards << "J"
      expect(player.bust?).to be true
    end
    it "should return false if player total is under 21" do
      player.cards << "2"
      player.cards << "10"
      player.cards << "5"
      expect(player.bust?).to be false
    end
  end

end