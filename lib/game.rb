require_relative 'card'
require_relative 'player'
require_relative 'deck'
require 'byebug'

class Game

  attr_reader :deck, :player_one, :dealer, :current_player

  def initialize(player_one)
    @deck = Deck.new
    @player_one = player_one
    @dealer = Player.new("Dealer")
    2.times do
      @player_one.hit(@deck)
      @dealer.hit(@deck)
    end
    @current_player = @player_one
    @game_over = false
  end

  def self.create(player_1)
    @game = Game.new(player_1)
  end

  def self.instance
    @game
  end

  def stick
    @current_player = @dealer
  end

  def hit
    @current_player.hit(@deck)
  end

  def blackjack?(player)
    player.calculate_score == 21
  end

  def bust?(player)
    player.calculate_score > 21
  end

  def dealer_play
    if @dealer.calculate_score < 17
      hit
    else
      @game_over = true
    end
  end

end
