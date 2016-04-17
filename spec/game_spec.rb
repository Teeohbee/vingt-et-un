require 'game'

describe Game do

  describe "initialize" do
    it "deals out two cards to each player" do
      toby = Player.new("Toby")
      game = Game.new(toby)
      expect(game.deck.cards.count).to eql 48
    end
  end

  describe "class methods" do
    it "can create an instance of the game" do
      toby = Player.new("Toby")
      game = Game.create(toby)
      expect(game).to be_instance_of(Game)
    end

    it "can returns that instance of the game" do
      toby = Player.new("Toby")
      @game = Game.create(toby)
      expect(Game.instance).to equal(@game)
    end
  end

  describe "blackjack?" do
    it "confirms a blackjack win scenario" do
      player = double :player
      allow(player).to receive(:hit)
      allow(player).to receive(:calculate_score) { 21 }
      game = Game.new(player)
      expect(game.blackjack?(player)).to eql true
    end
  end

  describe "bust?" do
    it "confirms a bust scenario" do
      player = double :player
      allow(player).to receive(:hit)
      allow(player).to receive(:calculate_score) { 22 }
      game = Game.new(player)
      expect(game.bust?(player)).to eql true
    end
  end

  # describe "blackjack or bust?" do
  #   it "confirms a win scenario when a player receives a blackjack" do
  #     player = double :player
  #     dealer = double :player
  #     allow(player).to receive(:hit)
  #     allow(dealer).to receive(:hit)
  #     allow(player).to receive(:calculate_score) { 21 }
  #     game = Game.new(player, dealer)
  #     expect(game.has_a_winner?).to eql "blackjack"
  #   end
  #
  #   it "confirms a win scenario when a loser receives a bust" do
  #     player = double :player
  #     dealer = double :player
  #     allow(player).to receive(:hit)
  #     allow(dealer).to receive(:hit)
  #     allow(player).to receive(:calculate_score) { 22 }
  #     game = Game.new(player, dealer)
  #     expect(game.has_a_winner?).to eql "bust"
  #   end
  #
  #   xit "confirms a win scenario when player has a higher score than the dealer at game end" do
  #     player = double :player
  #     dealer = double :player
  #     allow(player).to receive(:hit)
  #     allow(dealer).to receive(:hit)
  #     allow(player).to receive(:calculate_score) { 19 }
  #     allow(dealer).to receive(:calculate_score) { 17 }
  #     game = Game.new(player, dealer)
  #     expect(game.has_a_winner?).to eql "score"
  #   end
  #
  #   xit "does not confirm a win scenario while dealer has score less than 17" do
  #     player = double :player
  #     dealer = double :player
  #     allow(player).to receive(:hit)
  #     allow(dealer).to receive(:hit)
  #     allow(player).to receive(:calculate_score) { 19 }
  #     allow(dealer).to receive(:calculate_score) { 13 }
  #     game = Game.new(player, dealer)
  #     expect(game.has_a_winner?).to eql nil
  #   end
  # end

  describe "current player" do
    it "starts off pointing to player one" do
      player = double :player
      allow(player).to receive(:hit)
      game = Game.new(player)
      expect(game.current_player).to eql player
    end

    it "switches player when current player chooses to stick" do
      player = double :player
      allow(player).to receive(:hit)
      game = Game.new(player)
      game.stick
      expect(game.current_player.name).to eql "Dealer"
    end
  end

  describe "hit" do
      it "calls 'hit' on player" do
        player = double :player
        allow(player).to receive(:hit)
        game = Game.new(player)
        expect(player).to receive(:hit)
        game.hit
      end
  end

end
