require "spec_helper"

describe Player do
  let(:player){ Player.new }

  context "#initialize" do
    it "should be a Player" do
      expect(player).to be_a(Player)
    end
    it "should have a cards attribute" do
      expect(player.cards).to be_a(Array)
    end
    it "should be able to push to cards" do
      player.cards << "2"
      expect(player.cards).to eq ["2"]
    end
  end

end