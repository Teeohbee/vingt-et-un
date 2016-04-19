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

  describe "game_over?" do
    it "confirms game is over when a player receives a blackjack" do
      player = double :player
      allow(player).to receive(:hit)
      allow(player).to receive(:calculate_score) { 21 }
      game = Game.new(player)
      expect(game.game_over?).to eql true
    end

    it "confirms game is over when a player receives goes bust" do
      player = double :player
      allow(player).to receive(:hit)
      allow(player).to receive(:calculate_score) { 24 }
      game = Game.new(player)
      expect(game.game_over?).to eql true
    end
  end

  describe "winner" do
    it "returns the player who won the game from a blackjack" do
      player = double :player
      allow(player).to receive(:hit)
      allow(player).to receive(:calculate_score) { 21 }
      game = Game.new(player)
      expect(game.winner).to eql player
    end

    it "returns the player who won the game from a bust" do
      player = double :player
      allow(player).to receive(:hit)
      allow(player).to receive(:calculate_score) { 23 }
      game = Game.new(player)
      expect(game.winner.name).to eql "Dealer"
    end

    it "returns the player who won the game from a higher score" do
      player = double :player
      allow(player).to receive(:hit)
      allow(player).to receive(:calculate_score) { 20 }
      game = Game.new(player)
      allow(game.dealer).to receive(:calculate_score) { 17 }
      game.dealer_play
      expect(game.winner).to eql player
    end
  end

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

  describe "dealer play" do
      it "calls 'hit' on dealer if score is under 17" do
        player = double :player
        allow(player).to receive(:hit)
        game = Game.new(player)
        allow(game.dealer).to receive(:calculate_score) { 16 }
        expect(game.current_player).to receive(:hit)
        game.dealer_play
      end

      it "calls 'hit' on dealer if score is under 17" do
        player = double :player
        allow(player).to receive(:hit)
        game = Game.new(player)
        allow(game.dealer).to receive(:calculate_score) { 18 }
        expect(game.dealer_play).to eql true
      end
  end

end
