require 'game'

describe Game do

  describe "initialize" do
    it "deals out two cards to each player" do
      toby = Player.new("Toby")
      dealer = Player.new("Dealer")
      game = Game.new(toby, dealer)
      expect(game.deck.cards.count).to eql 48
    end
  end

  describe "class methods" do
    it "can create an instance of the game" do
      toby = Player.new("Toby")
      dealer = Player.new("Dealer")
      game = Game.create(toby, dealer)
      expect(game).to be_instance_of(Game)
    end

    it "can returns that instance of the game" do
      toby = Player.new("Toby")
      dealer = Player.new("Dealer")
      @game = Game.create(toby, dealer)
      expect(Game.instance).to equal(@game)
    end
  end

  describe "blackjack?" do
    it "confirms a blackjack win scenario" do
      player = double :player
      winning_player = double :player
      allow(player).to receive(:hit)
      allow(winning_player).to receive(:hit)
      allow(winning_player).to receive(:calculate_score) { 21 }
      game = Game.new(player, winning_player)
      expect(game.blackjack?(winning_player)).to eql true
    end
  end

  describe "bust?" do
    it "confirms a bust scenario" do
      player = double :player
      losing_player = double :player
      allow(player).to receive(:hit)
      allow(losing_player).to receive(:hit)
      allow(losing_player).to receive(:calculate_score) { 22 }
      game = Game.new(player, losing_player)
      expect(game.bust?(losing_player)).to eql true
    end
  end

  describe "has_a_winner?" do
    it "confirms a win scenario when a winner receives a blackjack" do
      player = double :player
      winning_player = double :player
      allow(player).to receive(:hit)
      allow(winning_player).to receive(:hit)
      allow(player).to receive(:calculate_score) { 13 }
      allow(winning_player).to receive(:calculate_score) { 21 }
      game = Game.new(player, winning_player)
      expect(game.has_a_winner?).to eql "blackjack"
    end

    it "confirms a win scenario when a loser receives a bust" do
      player = double :player
      losing_player = double :player
      allow(player).to receive(:hit)
      allow(losing_player).to receive(:hit)
      allow(player).to receive(:calculate_score) { 13 }
      allow(losing_player).to receive(:calculate_score) { 22 }
      game = Game.new(player, losing_player)
      expect(game.has_a_winner?).to eql "bust"
    end

    it "confirms a win scenario when player has a higher score than the dealer at game end" do
      player = double :player
      dealer = double :player
      allow(player).to receive(:hit)
      allow(dealer).to receive(:hit)
      allow(player).to receive(:calculate_score) { 19 }
      allow(dealer).to receive(:calculate_score) { 17 }
      game = Game.new(player, dealer)
      expect(game.has_a_winner?).to eql "score"
    end

    it "does not confirm a win scenario while dealer has score less than 17" do
      player = double :player
      dealer = double :player
      allow(player).to receive(:hit)
      allow(dealer).to receive(:hit)
      allow(player).to receive(:calculate_score) { 19 }
      allow(dealer).to receive(:calculate_score) { 13 }
      game = Game.new(player, dealer)
      expect(game.has_a_winner?).to eql nil
    end
  end

end
